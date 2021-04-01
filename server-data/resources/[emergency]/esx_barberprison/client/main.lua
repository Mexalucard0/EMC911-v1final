ESX = nil
local hasAlreadyEnteredMarker, lastZone, currentAction, currentActionMsg, hasPaid

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenShopMenu()
	hasPaid = false

	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
		menu.close()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title = _U('valid_purchase'),
			align = 'top-left',
			elements = {
				{label = _U('no'),  value = 'no'},
				{label = _U('yes'), value = 'yes'}
		}}, function(data, menu)
			menu.close()

			if data.current.value == 'yes' then
				ESX.TriggerServerCallback('esx_barberprison:checkMoney', function(hasEnoughMoney)
					if hasEnoughMoney then
						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_skin:save', skin)
						end)

						TriggerServerEvent('esx_barberprison:pay')
						hasPaid = true
					else
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin) 
						end)

						ESX.ShowNotification(_U('not_enough_money'))
					end
				end)
			elseif data.current.value == 'no' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin) 
				end)
			end

			currentAction = 'shop_menu'
			currentActionMsg = _U('press_access')
		end, function(data, menu)
			menu.close()
			currentAction = 'shop_menu'
			currentActionMsg = _U('press_access')
		end)
	end, function(data, menu)
		menu.close()

		currentAction    = 'shop_menu'
		currentActionMsg  = _U('press_access')
	end, {
		'beard_1',
		'beard_2',
		'beard_3',
		'beard_4',
		'hair_1',
		'hair_2',
		'hair_color_1',
		'hair_color_2',
	})
end

AddEventHandler('esx_barberprison:hasEnteredMarker', function(zone)
	currentAction = 'shop_menu'
	currentActionMsg = _U('press_access')
end)

AddEventHandler('esx_barberprison:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	currentAction = nil

	if not hasPaid then
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)
	end
end)


RegisterNetEvent('bnj:barbermenu')
AddEventHandler('bnj:barbermenu', function()
OpenShopMenu()
end)
