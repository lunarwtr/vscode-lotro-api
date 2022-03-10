local util   = require 'utility'
local client = require 'client'

function OnSetText(uri, text)
    local diffs = {}
    for start, realName, finish in text:gmatch [=[import[ ]*["']()(.-)()["']]=] do
        diffs[#diffs+1] = {
            start  = start,
            finish = finish - 1,
            text   = realName,
        }
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
        --print(util.dump(client.info))
        diffs[#diffs+1] = {
            start  = finish + 1,
            finish = finish + 2,
            text   = def,
        }
    end
    if #diffs == 0 then
        return nil
    end
    return diffs
end