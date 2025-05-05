-- Refresh player's roles
RegisterCommand("reload", function(source, args, raw)
    if #args <= 0 then return end
    if IsPlayerAceAllowed(source, "JakeHamblin.Reload") then
        local src = table.concat(args, " ")
        local serverIds = GetPlayers()
        local playerFound = false

        for k,v in ipairs(serverIds) do
            if tonumber(v) == tonumber(src) then
                playerFound = true
                removeRoles(tonumber(src))
                assignRoles(tonumber(src))
            end
        end

        if not playerFound then
            sendMessage(source, "No player exists with that ID")
        else
            sendMessage(source, "Player's permissions have been refreshed")
            sendMessage(src, "Your Discord permissions have been refreshed")
        end
    else
        sendMessage(source, "Not allowed to refresh player's permissions")
    end
end)

-- When a player drops, get rid of their roles
AddEventHandler('playerDropped', function (reason) 
    local src = source
    removeRoles(src)
end)

-- When a player connects, assign their roles
AddEventHandler("playerConnecting", function(name, setKickReason, deferrals)
    local src = source
    local discordID = getIdentifier(src, "discord")
    deferrals.defer()

    Wait(0)

    deferrals.update(string.format("Hello %s. Your Discord ID is being checked", name))

    if not discordID then
        deferrals.done("You are not connected to Discord.")
    else
        local status = assignRoles(src)

        Wait(0)

        if status == 10007 or status == 404 then
            deferrals.done("You are not in our Discord.")
        else
            deferrals.done()
        end
    end
end)

-- When the Discord Integration resource is restart, readd the proper ACE permission to groups
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == "DiscordIntegration" then
        for k,v in pairs(config.roles) do
            ExecuteCommand("add_ace group."..k.." \"group."..k.."\" allow")
        end
    end
end)

-- Get's specified identifier from player
function getIdentifier(src, identifier)
	local identifiers = GetPlayerIdentifiers(src)

	for k,v in pairs(identifiers) do
		if string.sub(v, 1, string.len(identifier..":")) == identifier..":" then
			return v
		end
	end
end

-- Get's Discord roles from player
function getDiscordRoles(method, discordID, jsondata)
    local data = nil
    PerformHttpRequest("https://discordapp.com/api/guilds/"..config.guild_id.."/members/"..discordID, function(errorCode, resultData, resultHeaders)
        data = {data=resultData, code=errorCode, headers=resultHeaders}
    end, method, #jsondata > 0 and json.encode(jsondata) or "", {["Content-Type"] = "application/json", ["Authorization"] = "Bot "..config.bot_token})

    while data == nil do
        Citizen.Wait(0)
    end
    
    return data
end

function assignRoles(src)
    local discordID = getIdentifier(src, "discord")
    local discordRoles = getDiscordRoles("GET", discordID:gsub("discord:", ""), {})

    if discordRoles.code == 10007 then
    else
        local data = json.decode(discordRoles.data)
        if data ~= nil then
            for k,v in pairs(config.roles) do 
                for ki, vi in ipairs(data.roles) do
                    if tostring(v) == tostring(vi) then
                        ExecuteCommand("add_principal identifier."..discordID.." group."..k)
                    end
                end
            end
        end
    end

    return discordRoles.code
end

function removeRoles(src)
    local discordID = getIdentifier(src, "discord")
    for k,v in pairs(config.roles) do
        ExecuteCommand("remove_principal identifier."..discordID.." group."..k)
    end
end

function sendMessage(src, message)
    TriggerClientEvent('chat:addMessage', src, {color = { 255, 0, 0}, multiline = true, args = {"[Discord Integration]", message}})
end