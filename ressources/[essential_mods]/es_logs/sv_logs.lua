-- nouvelle config globale ! 
require "resources/gconfig/gconfig"

AddEventHandler('es:chatMessage', function(source, msg, user)
	local tstamp2 = os.date("*t", os.time())

	MySQL:executeQuery("INSERT INTO logs_chat (`sender`, `timestamp`, `message`) VALUES ('@username', '@now', '@message')",
		{['@username'] = user.identifier, ['@message'] = msg, ['@now'] = os.date(tstamp2.year .. "-" .. tstamp2.month .. "-" .. tstamp2.day .. " " .. tstamp2.hour .. ":" .. tstamp2.min .. ":" .. tstamp2.sec)})
end)

AddEventHandler('es:adminCommandRan', function(source, msg, user)
	local tstamp2 = os.date("*t", os.time())

	msg = table.concat(msg, " ")

	MySQL:executeQuery("INSERT INTO logs_admin (`sender`, `timestamp`, `command`) VALUES ('@username', '@now', '@message')",
		{['@username'] = user.identifier, ['@message'] = msg, ['@now'] = os.date(tstamp2.year .. "-" .. tstamp2.month .. "-" .. tstamp2.day .. " " .. tstamp2.hour .. ":" .. tstamp2.min .. ":" .. tstamp2.sec)})
end)

AddEventHandler('es:userCommandRan', function(source, msg, user)
	local tstamp2 = os.date("*t", os.time())

	msg = table.concat(msg, " ")

	MySQL:executeQuery("INSERT INTO logs_commands (`sender`, `timestamp`, `command`) VALUES ('@username', '@now', '@message')",
		{['@username'] = user.identifier, ['@message'] = msg, ['@now'] = os.date(tstamp2.year .. "-" .. tstamp2.month .. "-" .. tstamp2.day .. " " .. tstamp2.hour .. ":" .. tstamp2.min .. ":" .. tstamp2.sec)})
end)