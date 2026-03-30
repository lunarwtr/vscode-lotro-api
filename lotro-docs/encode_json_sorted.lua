function encode_json_sorted(tbl)
    local function encode_value(val)
        if type(val) == "string" then
            return '"' .. val:gsub('"', '\\"') .. '"'
        elseif type(val) == "number" or type(val) == "boolean" then
            return tostring(val)
        elseif type(val) == "table" then
            return encode_json_sorted(val)
        else
            return "null"
        end
    end

    local keys = {}
    for k in pairs(tbl) do
        table.insert(keys, k)
    end
    table.sort(keys)

    local result = "{"
    for i, k in ipairs(keys) do
        result = result .. '"' .. tostring(k) .. '":' .. encode_value(tbl[k])
        if i < #keys then
            result = result .. ","
        end
    end
    result = result .. "}"
    return result
end
