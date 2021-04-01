ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_barberprison:pay')
AddEventHandler('esx_barberprison:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local object = xPlayer.getInventoryItem('ticket').count

	if object >= 3 then

	xPlayer.removeInventoryItem('ticket', 3)
	TriggerClientEvent('esx:showNotification', source, _U('you_paid', ESX.Math.GroupDigits(Config.Price)))
	end
end)

ESX.RegisterServerCallback('esx_barberprison:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.getMoney() >= Config.Price)
end)
