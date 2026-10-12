local BASE = "https://keysys.quanlivps5.workers.dev"
local HttpService = game:GetService("HttpService")

if not getgenv().Key or getgenv().Key == "" then
    return warn("Bạn chưa nhập Key")
end

local hwid = (gethwid and gethwid()) or game:GetService("RbxAnalyticsService"):GetClientId()
getgenv().HWID = hwid

local res = game:HttpGet(BASE.."/script?key="..HttpService:UrlEncode(getgenv().Key).."&hwid="..HttpService:UrlEncode(hwid))

if res:sub(1, 4) == "ERR:" then
    warn("Key lỗi: " .. res:sub(5))
else
    loadstring(res)()
end
