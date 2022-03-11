local util   = require 'utility'
local client = require 'client'

local split = function(s, sep)
    local fields = {}
    local sep = sep or " "
    local pattern = string.format("([^%s]+)", sep)
    ---@diagnostic disable-next-line: discard-returns
    string.gsub(s, pattern, function(c) fields[#fields + 1] = c end)
    return fields
end

function OnSetText(uri, text)
    local diffs = {}
    for before, start, realName, finish, after in text:gmatch [=[()import[ ]*["']()(.-)()["'];?()]=] do
        local prev = nil;
        local def = "";
        for p in string.gmatch(realName, "([^.]+)") do
            def = def .. "if not "..p.." then\n---@class "..p.."\n"..p.." = {}\nend\n"
            if prev then
               def = def .. prev .. "." .. p .. "=" .. p .. "\n"
            end
            prev = p
        end
        def = def .. "---@diagnostic disable\n"
        def = def .. "__vsclotroloop = 1\nwhile true do\n"
        def = def .. "local name, value = debug.getlocal(1, __vsclotroloop)\n"
        def = def .. "if not name then\nbreak\nend\n"..prev.."[name] = value\n__vsclotroloop = __vsclotroloop + 1\nend\n"
        def = def .. "---@diagnostic enable\n"
        --print((string.sub(text, before, after) .. def):gsub("\n", "|\n"))
        --print("-------------------------")
        diffs[#diffs+1] = {
            start  = after + 1,
            finish = after,
            text   = def,
        }
    end
    --- NewClassName = class(Turbine.UI.Window)
    for start, spacing, newclass, parent in text:gmatch("()(%s*)([%.%w]*)%s*=%s*class%(([^%)]+)%)") do
        local ncp = split(newclass, ".");
        local name = ncp[#ncp]
        local pp = split(parent, ".");
        local pname = pp[#pp]
        local def = spacing.."---@class "..name.." : "..pname.."\n"
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