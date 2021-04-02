local ESX = nil
local LastRobs = {}


TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

RegisterServerEvent('myBurglary:setLast')
AddEventHandler('myBurglary:setLast', function(missionIndex)
    local currentTime = os.time()
    LastRobs[missionIndex] = currentTime
end)

ESX.RegisterServerCallback('myBurglary:checkLast', function(source, cb, index)
    local currentTime = os.time()
    --print('get from ' .. index)
    if LastRobs[index] ~= nil then
        local diff = os.difftime(currentTime, LastRobs[index])
        local minutes = diff / 60
        --print(minutes)
        if minutes >= Config.Missions[index].delay then
            cb(0)
        else
            cb(Config.Missions[index].delay - minutes)
        end
    else
        cb(0)
    end
    
end)

ESX.RegisterServerCallback('myBurglary:checkItem', function(source, cb, item)

    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem(item).count >= 1 then
        cb(true)
    else
        cb(false)
    end

end)

ESX.RegisterServerCallback('myBurglary:checkCops', function(source, cb)

    local xPlayers = ESX.GetPlayers()

	local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
		end
    end
    
    cb(cops)

end)

RegisterServerEvent('myBurglary:addItem')
AddEventHandler('myBurglary:addItem', function(item, amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    --print('add item:' .. item .. amount)
    xPlayer.addInventoryItem(item, amount)
end)

RegisterServerEvent('myBurglary:removeLockpick')
AddEventHandler('myBurglary:removeLockpick', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    --print('add item:' .. item .. amount)
    xPlayer.removeInventoryItem(Config.LockpickItem, 1)
end)

RegisterServerEvent('myBurglary:addMoney')
AddEventHandler('myBurglary:addMoney', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    -- ADD BLACK MONEY
    --print('add money:' .. amount)
    if Config.useBlackMoney then
        xPlayer.addAccountMoney(Config.BlackMoneyName, amount)
    else
        xPlayer.addMoney(amount)
    end
    
end)

RegisterServerEvent('myBurglary:callCops')
AddEventHandler('myBurglary:callCops', function(location)

    TriggerClientEvent('myBurglary:callPolice', -1, location)

end)


RegisterServerEvent('myBurglary:sellItems')
AddEventHandler('myBurglary:sellItems', function(item, amount, price)

    local _source   = source
    local xPlayer   = ESX.GetPlayerFromId(_source)
    local itemCount = xPlayer.getInventoryItem(item).count

    if itemCount >= amount then

        xPlayer.removeInventoryItem(item, amount)
        if Config.useBlackMoney then
            xPlayer.addAccountMoney(Config.BlackMoneyName, amount * price)
        else
            xPlayer.addMoney(amount * price)
        end
        TriggerClientEvent('myBurglary:msg', _source, Translation[Config.Locale]['items_sold_for'] .. price * amount .. '$')

    else
        TriggerClientEvent('myBurglary:msg', _source, Translation[Config.Locale]['you_only_have_items'] .. itemCount .. Translation[Config.Locale]['you_only_have_items2'])
    end

end)