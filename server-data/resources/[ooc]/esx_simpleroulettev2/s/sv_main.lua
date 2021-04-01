--[[
Descripttion: 
version: 
Author: Shaolada
Date: 2021-03-20 22:19:31
LastEditors: Shaolada
LastEditTime: 2021-03-20 22:29:05
--]]
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local maksu = 0
RegisterServerEvent('slerbaruletti:bettaa')
AddEventHandler('slerbaruletti:bettaa', function(osallistumismaksu, colour)
    local xPlayer = ESX.GetPlayerFromId(source)
	local _source = source
    local colors = math.random(0,37)
    if xPlayer.getAccount('bank').money >= osallistumismaksu then
        xPlayer.removeAccountMoney('bank', tonumber(osallistumismaksu))

		TriggerClientEvent('esx:showNotification', _source, '你的赌注: ~g~' .. osallistumismaksu .."$")
		Wait(3000)
		TriggerClientEvent('esx:showNotification', _source, '~m~小球 ~w~正在滚动...')
		Wait(3000)
		TriggerClientEvent('esx:showNotification', _source, '~o~小球正在向右转动...')
		Wait(2600)
		TriggerClientEvent('esx:showNotification', _source, '~m~小球 ~w~正在停止滚动...')
		Wait(2000)
        if colour == 'red' then
			if colors >= 18 and colors <= 36 then
				TriggerClientEvent('esx:showNotification', _source, '~m~小球~w~ 停在了: ~r~~h~红色~h~~w~.')
				Wait(200)
				maksu = osallistumismaksu*2
				xPlayer.addAccountMoney('bank', maksu) 
				TriggerClientEvent('esx:showNotification', _source, '~g~你赢了: ' ..maksu..'€')
			else
				TriggerClientEvent('esx:showNotification', _source, '~m~小球~w~ 停在了:  ~h~~u~ 黑色~h~~w~.')
				TriggerClientEvent('esx:showNotification', _source, "~r~你输了!")
			end
        elseif colour == 'black' then
			if colors >= 1 and colors <= 17 then
			TriggerClientEvent('esx:showNotification', _source, '~m~小球~w~ 停在了:  ~u~~h~黑色~h~~w~.')
			Wait(200)
			maksu = osallistumismaksu*2
            xPlayer.addAccountMoney('bank', maksu) 
            TriggerClientEvent('esx:showNotification', _source, '~g~你赢了: ' ..maksu..'€')
        else
			TriggerClientEvent('esx:showNotification', _source, '~m~小球~w~ 停在了:  ~h~~r~红色~h~~w~.')
            TriggerClientEvent('esx:showNotification', _source, "~r~你输了.")
        end
        elseif colour == 'green' then
			if colors == 37 then
				TriggerClientEvent('esx:showNotification', _source, '~m~小球~w~ 停在了: ~g~~h~绿色~h~~w~.')
				Wait(200)
				maksu = osallistumismaksu*14
				xPlayer.addAccountMoney('bank', maksu) 
				TriggerClientEvent('esx:showNotification', _source, '~g~你赢了: ' ..maksu..'€')
			else
				TriggerClientEvent('esx:showNotification', _source, '~m~小球~w~ 停在了: ~h~~r~红色~h~~w~.~n~ 你输了')
        end
	end
	else
		TriggerClientEvent('esx:showNotification', _source, '没有足够的金钱')
    end
end)