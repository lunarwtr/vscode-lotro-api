local util   = require 'utility'
local client = require 'client'
local fs     = require 'bee.filesystem'

local split = function(s, sep)
    local fields = {}
    local sep = sep or " "
    local pattern = string.format("([^%s]+)", sep)
    ---@diagnostic disable-next-line: discard-returns
    string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
    return fields
end
function string.starts(String,Start)
    return string.sub(String,1,string.len(Start))==Start
end
local longnametoclass = {
	["Turbine.UI.Lotro.Button"] = "LotroButton",
	["Turbine.UI.Lotro.CheckBox"] = "LotroCheckBox",
	["Turbine.UI.Lotro.DragDropInfo"] = "LotroDragDropInfo",
	["Turbine.UI.Lotro.ScrollBar"] = "LotroScrollBar",
	["Turbine.UI.Lotro.TextBox"] = "LotroTextBox",
	["Turbine.UI.Lotro.Window"] = "LotroWindow"
};
local rootHasPlugin = nil
local definednamespace = {}
function OnSetText(uri, text)
    local diffs = {}
    for before, start, realName, finish, after in text:gmatch [=[()import[ ]*["']()(.-)()["'];?()]=] do
        if realName ~= 'Turbine' and not string.starts(realName, 'Turbine.') then
            local prev = nil;
            local def = "";
            for p in string.gmatch(realName, "([^.]+)") do
                if definednamespace[p] == nil then
                    def = def .. "---@class "..p.."\n"..p.." = {}\n"
                    if prev then
                        def = def .. prev .. "." .. p .. "=" .. p .. "\n"
                    end
                    definednamespace[p] = true
                end
                prev = p
            end
            diffs[#diffs+1] = {
                start  = after + 1,
                finish = after,
                text   = def,
            }
            local rootPath = fs.path(client.info.rootPath)
            local rootFolder = rootPath:filename():string()
            if string.starts(realName, rootFolder) then
                --- if the editor opened root of plugin folder
                --- then include paths dont work right
                if rootHasPlugin == nil then
                    rootHasPlugin = false
                    for path in fs.pairs(rootPath, nil) do
                        if path:extension():string() == '.plugin' then
                            rootHasPlugin = true
                            break
                        end
                    end
                end
                if rootHasPlugin then
                    if realName == rootFolder then
                        diffs[#diffs+1] = {
                            start  = start,
                            finish = finish - 1,
                            text   = '__init__.lua',
                        }
                    else
                        diffs[#diffs+1] = {
                            start  = start,
                            finish = start + rootFolder:len(),
                            text   = '',
                        }
                    end
                end
            end
        end
    end
    definednamespace = {}
    --- NewClassName = class(Turbine.UI.Window)
    for start, newclass, parent in text:gmatch("()([%.%w]*)%s*=%s*class%(%s*([^%)%s]+)%s*%)") do
        local ncp = split(newclass, ".");
        local name = ncp[#ncp]
        local pp = split(parent, ".");
        local pname = pp[#pp]
        local altpname = longnametoclass[parent]
        if altpname ~= nil then
            pname = altpname
        end
        local def = ('---@class %s : %s\n---@type fun():%s\n'):format(name, pname, name)
        diffs[#diffs+1] = {
            start  = start,
            finish = start-1,
            text   = def,
        }
    end
    if #diffs == 0 then
        return nil
    end
    return diffs
end