require "resources/esx_phone/lib/MySQL"
MySQL:open("VOTRE IP", "LOGIN", "DB", "PASSWORD")
local RegisteredCallbacks = {}

local function GenerateUniquePhoneNumber()

	local foundNumber = false
	local phoneNumber = nil

	while not foundNumber do

		phoneNumber = math.random(10000, 99999)

		local executed_query = MySQL:executeQuery("SELECT COUNT(*) as count FROM users WHERE phone_number = '@phoneNumber'", {['@phoneNumber'] = phoneNumber})
		local result         = MySQL:getResults(executed_query, {'count'})
		local count          = tonumber(result[1].count)

		if count == 0 then
			foundNumber = true
		end

	end

	return phoneNumber

end

AddEventHandler('onResourceStart', function(ressource)
	if ressource == 'esx_phone' then
		TriggerEvent('esx_phone:ready')
	end
end)

AddEventHandler('es:playerLoaded', function(source)

	local _source = source

	TriggerEvent('es:getPlayerFromId', source, function(user)

		local executed_query = MySQL:executeQuery("SELECT * FROM users WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result         = MySQL:getResults(executed_query, {'phone_number'})
		local phoneNumber    = result[1].phone_number

		if phoneNumber == nil then
			phoneNumber = GenerateUniquePhoneNumber()
			MySQL:executeQuery("UPDATE users SET phone_number = '@phone_Number' WHERE identifier = '@identifier'", {['@identifier'] = user.identifier, ['@phone_Number'] = phoneNumber})
		end

		user['phoneNumber'] = phoneNumber

		local contacts = {}

		local executed_query2 = MySQL:executeQuery("SELECT * FROM user_contacts WHERE identifier = '@identifier'", {['@identifier'] = user.identifier})
		local result2         = MySQL:getResults(executed_query2, {'name', 'number'})

		for i=1, #result2, 1 do
			
			table.insert(contacts, {
				name   = result2[i].name,
				number = result2[i].number,
				type   = 'player'
			})

		end

		user['contacts'] = contacts

		TriggerClientEvent('esx_phone:loaded', _source, phoneNumber, contacts)

	end)
end)

RegisterServerEvent('esx_phone:registerCallback')
AddEventHandler('esx_phone:registerCallback', function(type, cb)
	if RegisteredCallbacks[type] == nil then
		RegisteredCallbacks[type] = {}
	end
	table.insert(RegisteredCallbacks[type], cb)
	print("DEBUG 0001 " .. RegisteredCallbacks[type])
	print("DEBUG 0002 " .. cb)
end)

RegisterServerEvent('esx_phone:send')
AddEventHandler('esx_phone:send', function(type, phoneNumber, playerName, message)
	for i=1, #RegisteredCallbacks[type], 1 do
		RegisteredCallbacks[type][i](source, phoneNumber, playerName, type, message)
	end
end)

RegisterServerEvent('esx_phone:addPlayerContact')
AddEventHandler('esx_phone:addPlayerContact', function(phoneNumber)

		local _source = source

		TriggerEvent('es:getPlayers', function(users)
			
			local foundNumber = false;
			local foundPlayer = nil

			for k, v in pairs(users) do
				if v.phoneNumber == phoneNumber then
					foundNumber = true
					foundPlayer = v.name
					print("DEBUG " .. v.name)
				end
			end

			if foundNumber then

				TriggerEvent('es:getPlayerFromId', _source, function(user)

					if phoneNumber == user.phoneNumber then
						TriggerClientEvent('es_freeroam:notify', user, 'CHAR_ANDREAS', {255,0,0} 'Vous ne pouvez pas vous ajouter vous-même')
					else

						local hasAlreadyAdded = false

						for i=1, #user.contacts, 1 do
							if user.contacts[i].number == phoneNumber then
								hasAlreadyAdded = true
							end
						end

						if hasAlreadyAdded then
							TriggerClientEvent('es_freeroam:notify', user, 'CHAR_ANDREAS', {255,0,0} 'Ce numéro est déja dans votre liste de contacts')
						else
						    
                                table.insert(user.contacts, {
                    				name   = playerName,
                    				number = phoneNumber,
                    				type   = 'player'
                    			})
                        		local executed_query69 = MySQL:executeQuery("SELECT name FROM users WHERE phone_number = '@phone69'", {['@phone69'] = phoneNumber})
    		                    local result69         = MySQL:getResults(executed_query69, {'name'})
                        		local phone99 = result69[1].name;
    		                    print("DEBUG " .. phone99)
    							MySQL:executeQuery("INSERT INTO user_contacts (identifier, name, number) VALUES ('@identifier', '@name69', '@number')", {['@identifier'] = user.identifier, ['@name69'] = phone99, ['@number'] = phoneNumber})
    			                TriggerClientEvent('esx_phone:addContact', _source, phone99, phoneNumber, 'player', true)
                             
                             
						end
					end

				end)

			else
				TriggerClientEvent('es_freeroam:notify', user, 'CHAR_ANDREAS', {255,0,0} 'Ce numéro n\'existe pas ou le joueur n\'est pas connecté')
			end

		end)
end)

AddEventHandler('esx_phone:ready', function()
	
	TriggerEvent('esx_phone:registerCallback', 'player', function(source, phoneNumber, playerName, type, message)
		TriggerEvent('es:getPlayerFromId', source, function(user)
			TriggerEvent('es:getPlayers', function(users)
				for k, v in pairs(users) do
					if v.phoneNumber == phoneNumber then
						RconPrint('Message => ' .. playerName .. ' ' .. message)
						TriggerClientEvent('esx_phone:onMessage', v.source, phoneNumber, playerName, type, message, {''})
					end
				end
			end)
		end)
	end)

end)
