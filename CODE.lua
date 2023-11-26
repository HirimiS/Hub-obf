local P = {2753915549,4442272183,7449423635};
for i,v in pairs(game:GetService("Players"):GetChildren()) do
	shared.Min = i
end

game:GetService("RunService").Heartbeat:Connect(function()
	for i,v in pairs(P) do
		if v == game.PlaceId then
			if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
				shared.Mystic = "Spawn"
			else
				shared.Mystic = "Not spawn"
			end
			
			if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
				shared.FullMoon = tostring("100%".." | ".."Full Moon")
			elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
				shared.FullMoon = tostring("75%")
			elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709143733" then
				shared.FullMoon = tostring("50%")
			elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709150401" then
				shared.FullMoon = tostring("25%")
			elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149680" then
				shared.FullMoon = tostring("15%")
			else
				shared.FullMoon = tostring("0%".." | ".."Fake Moon")
			end
		end
	end
end)

for i,v in pairs(P) do
	if v == game.PlaceId and game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
		local url =
			"https://discord.com/api/webhooks/1178148692465819740/TtOQMrMkqF6Tjpb_Rde-bTAJ5-x6qivmXXPFtIMWWTEcetUZBPuEaTGYVQYZ3wORz1AJ"
		local data = {
			["embeds"] = {
				{
					["description"] = "**MIRAGE ISLAND**\n```lua\n"..tostring('game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport","'..game.JobId..'")').."\n```",
					["color"] = 16711751,
					["fields"] = {
						{["name"] = "**Players Count: **",["value"] = "```yaml\n"..shared.Min.."/"..game:GetService("Players").MaxPlayers.."\n```",["inline"] = true,},
						{["name"] = "**Job ID: **",["value"] = "```yaml\n"..game.JobId.."\n```",["inline"] = true,},
						{["name"] = "**Moon Status :**",["value"] = "```yaml\n"..shared.FullMoon.."\n```",["inline"] = true,},
						{["name"] = "**Mirage Status :**",["value"] = "```lua\n"..tostring(shared.Mystic).."\n```",["inline"] = true,}
					},
					["footer"] = {
						["text"] = "Mirage Notify - HIRIMI HUB",
						["icon_url"] = "https://images-ext-1.discordapp.net/external/TZj5es8hQL6PD26KEM2h8dRrQd-U_PNmPWJbmcE_Y2g/%3Fsize%3D512/https/cdn.discordapp.com/icons/1138498222273339485/d4ce4d91a5e3025b2a1a11a02c2c7082.png?format=webp&width=473&height=473"
					},
					["timestamp"] = DateTime.now():ToIsoDate(),
					["thumbnail"] = {
						["url"] = "https://images-ext-1.discordapp.net/external/TZj5es8hQL6PD26KEM2h8dRrQd-U_PNmPWJbmcE_Y2g/%3Fsize%3D512/https/cdn.discordapp.com/icons/1138498222273339485/d4ce4d91a5e3025b2a1a11a02c2c7082.png?format=webp&width=473&height=473"
					}
				}
			},
		}
		local newdata = game:GetService("HttpService"):JSONEncode(data)

		local headers = {
			["content-type"] = "application/json"
		}
		request = http_request or request or HttpPost or syn.request
		local R = {Url = url, Body = newdata, Method = "POST", Headers = headers}
		request(R)
	end
end
