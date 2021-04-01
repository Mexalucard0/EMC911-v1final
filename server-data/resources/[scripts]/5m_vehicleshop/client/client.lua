local spawncoords=0
local HeadingLuxury = 0
local VehicleCoordsLuxury = nil
local VehicleCoordsToSpawnAt = nil
local VehicleCoordsNormal = nil
local HeadingNormal = 0
local HeadingToSpawnAt = 0
local do_debug = false
_print = print
print = function(...)
	if do_debug then
    _print(...)
  end
end

local menuOpen = false
ESX = nil

-- data from server:
vehicles = {}
display = {}

-- loaded display cars:
DisplayCars = {}
PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	GetCarDealerData()
	CreateDealerBlip()
	Citizen.Wait(3000)
	SpawnDisplayVeh()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
	Citizen.Wait(20000)
	TriggerServerEvent("fivem_vehicleshop:CheckFinanceStatus")
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

-- Server called event to Replace Veh:
RegisterNetEvent('fivem_vehicleshop:ReplaceVehCL')
AddEventHandler('fivem_vehicleshop:ReplaceVehCL', function(car, currentID)
	ReplaceVehicle(car, currentID)
end)

-- Server called event to get car dealer data:
RegisterNetEvent('fivem_vehicleshop:ChangeCommissionCL')
AddEventHandler('fivem_vehicleshop:ChangeCommissionCL', function()
	--GetCarDealerData()
	GetDisplayCarData()
	ChangingValues = false
end)

-- Server called event to get car dealer data:
RegisterNetEvent('fivem_vehicleshop:ChangeDownpaymentCL')
AddEventHandler('fivem_vehicleshop:ChangeDownpaymentCL', function()
	--GetCarDealerData()
	GetDisplayCarData()
	ChangingValues = false
end)

-- Server called event to get car dealer data:
RegisterNetEvent('fivem_vehicleshop:UpdateCarDealerStockCL')
AddEventHandler('fivem_vehicleshop:UpdateCarDealerStockCL', function(vehModel,vehPlate)
	ShowNotifyESX(_U('veh_repossessed',vehPlate))
	local VehHash = vehModel
	local VehName = string.lower(GetDisplayNameFromVehicleModel(VehHash))
	ESX.TriggerServerCallback('fivem_vehicleshop:UpdateDealerStock', function(stockUpdated)
		if stockUpdated then
			GetCarDealerData()
			--GetDisplayCarData()
		end
	end, VehName)
end)

print("we here?")
Citizen.CreateThread(function()
	Citizen.Wait(10000)
	print("done?")
	while true do
		Citizen.Wait(1000)
		local player = GetPlayerPed(-1)
		local coords = GetEntityCoords(player)
		for k,v in pairs(Config.PurchasedVehSpawnLuxury) do
			VehicleCoordsLuxury = {x = v.Pos[1], y = v.Pos[2], z = v.Pos[3]}
			HeadingLuxury = v.H
		end
		for k,v in pairs(Config.PurchasedVehSpawn) do
			VehicleCoordsNormal = {x = v.Pos[1], y = v.Pos[2], z = v.Pos[3]}
			HeadingNormal = v.H
		end
		if GetDistanceBetweenCoords(coords, VehicleCoordsNormal.x,VehicleCoordsNormal.y,VehicleCoordsNormal.z , true) < GetDistanceBetweenCoords(coords, VehicleCoordsLuxury.x,VehicleCoordsLuxury.y,VehicleCoordsLuxury.z , true) then
			VehicleCoordsToSpawnAt = VehicleCoordsNormal
			HeadingToSpawnAt = HeadingNormal
		else
			VehicleCoordsToSpawnAt = VehicleCoordsLuxury
			HeadingToSpawnAt = HeadingLuxury
		end
		
	end
end)

ChangingValues = false
BuyInProgress = false	
Citizen.CreateThread(function()
	Citizen.Wait(3000)
	local player = GetPlayerPed(-1)
	local coords = GetEntityCoords(player)
	
	local carDist,carPos,carModel = GetClosestVehDisplay(coords)
		
	while true do
		Citizen.Wait(0)
		local player = GetPlayerPed(-1)
		local coords = GetEntityCoords(player)
		-- Check if within load distance from config:
			-- store closest veh data into each locale variables:
			carDist,carPos,carModel = GetClosestVehDisplay(coords)
			-- Check if within draw text distance from Config:
			if carDist and carDist <= Config.DrawTxtDist then
				local currentName, currentPriceStr, currentModel, currentPrice, currentCommission, currentDownpayment, currentCategory, currentID, swapCar = '', '', nil, 0, 0, 0, nil, 0, ''
				local waitTimer = GetGameTimer()
				-- Get Type of closest Display Vehicle:
				for k,v in pairs(display) do 
					if v.model == carModel then 
						currentName 		= v.name
						currentPriceStr 	= tostring(v.price)
						currentModel 		= v.model
						currentPrice 		= v.price
						currentCommission 	= v.commission
						currentDownpayment 	= v.downpayment
						currentCategory 	= v.category
						currentID			= k
						currentStock		= v.stock
						swapCar 			= _U('swap_car_label')
					end
				end
				
				-- Key Control to Buy Vehicle:
				if (IsControlJustPressed(0, Config.KeyToBuyVeh) or IsDisabledControlJustPressed(0, Config.KeyToBuyVeh)) then
					if currentStock >= 1 then
						local Confirmed = false
						while Confirmed == false do
							Citizen.Wait(0)
							local carDist2,carPos2,carModel2,carID2 = GetClosestVehDisplay(coords)
							if (carDist2 and Config.DrawTxtDist and carModel2 and carModel) and (carDist2 <= Config.DrawTxtDist and carModel2 == carModel) then
								-- Text to Confirm The Purchase:
								DrawText3Ds(carPos[1],carPos[2],carPos[3] + 0.54, _U('confirm_cancel_purchase'))
								if not IsPedInAnyVehicle(player, true) and not BuyInProgress then
									-- Complete Purchase:	
									if (IsControlJustPressed(0, Config.KeyToConfirmBuyVeh) or IsDisabledControlJustPressed(0, Config.KeyToConfirmBuyVeh)) then
										ESX.TriggerServerCallback('fivem_vehicleshop:GetPlayerMoney', function(hasMoney, carPrice, carCommission, price, payment)
											if hasMoney then
												BuyInProgress = true
												local VehCoords = nil
												local Heading = 0
												Heading = HeadingToSpawnAt
												VehCoords = VehicleCoordsToSpawnAt
												SpawnPurchasedVehicle(currentModel, VehCoords, Heading, player, carPrice, carCommission, price, payment)	
												Confirmed = true								
											else
												ShowNotifyESX(_U("veh_not_enough_money"))
												Citizen.Wait(250)
												BuyInProgress = false
												Confirmed = true
											end
										end, currentModel, currentPrice, currentStock)
									-- Cancel Purchase:	
									elseif (IsControlJustPressed(0, Config.KeyToCancelBuyVeh) or IsDisabledControlJustPressed(0, Config.KeyToCancelBuyVeh)) then
										Citizen.Wait(100)
										ShowNotifyESX(_U('veh_purchase_cancel'))
										BuyInProgress = false
										Confirmed = true
									end
								end
							else
								Confirmed = true
							end
						end
					else
						ShowNotifyESX(_U("veh_not_in_stock"))
					end
								
				-- SWAP VEHICLE MENU:
				elseif (IsControlJustPressed(0, Config.KeyToSwapVehicle, IsDisabledControlJustPressed(0, Config.KeyToSwapVehicle))) then
					if PlayerData.job ~= nil and PlayerData.job.name == Config.CarDealerJobLabel then
						local carDist2,carPos2,carModel2,carID2 = GetClosestVehDisplay(coords)
						if carDist2 then 
							Citizen.Wait(200)
							OpenReplaceMainMenu(carID2)
						end
					end
				-- TEST DRIVE:
				elseif (IsControlJustPressed(0, Config.KeyToTestVehicle, IsDisabledControlJustPressed(0, Config.KeyToTestVehicle))) then
					if PlayerData.job ~= nil and PlayerData.job.name == Config.CarDealerJobLabel then
						local carDist2,carPos2,carModel2,carID2 = GetClosestVehDisplay(coords)
						if carDist2 then 
							Citizen.Wait(200)
							TestDriveVehicleFunction(currentModel, carID2)
						end
					end
					
				-- CHANGE COMMISSION PERCENTS:
				elseif IsControlJustPressed(0, Config.KeyToChangeCom) and not ChangingValues then
					if PlayerData.job ~= nil and PlayerData.job.name == Config.CarDealerJobLabel then
						local carDist2,carPos2,carModel2,carID2 = GetClosestVehDisplay(coords)
						if carDist2 then
							ChangingValues = true
							ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'cardealer_commission_change', {
								title = "Enter Commission Value"
							},
							function(data, menu)
								menu.close()
								local amount = tonumber(data.value)
								if amount == nil or amount == '' then
									ShowNotifyESX(_U('invalid_amount'))
									ChangingValues = false
								else
									if amount < Config.MinCommission or amount > Config.MaxCommission then
										ShowNotifyESX("Min/Max Commission Error")
										ChangingValues = false
									else
										TriggerServerEvent('fivem_vehicleshop:ChangeCommissionSV', currentModel, amount, carID2)
										exports['progressBars']:startUI(500, "APPLYING CHANGES")
										Citizen.Wait(500)
										ChangingValues = false
										ESX.UI.Menu.CloseAll()
									end
								end
							end,
							function(data, menu)
								menu.close()
								ChangingValues = false	
							end)
						end
					end
						
				-- FINANCE OPTION:
				elseif (IsControlJustPressed(0, Config.KeyToFinanceVeh) or IsDisabledControlJustPressed(0, Config.KeyToFinanceVeh)) then
					if currentStock >= 1 then
						local Financed = false
						while Financed == false do
							Citizen.Wait(0)
							local carDist2,carPos2,carModel2,carID2 = GetClosestVehDisplay(coords)
							if (carDist2 and Config.DrawTxtDist and carModel2 and carModel) and (carDist2 <= Config.DrawTxtDist and carModel2 == carModel) then
								-- Text to Confirm The Financing:
								DrawText3Ds(carPos[1],carPos[2],carPos[3] + 0.54, _U("confirm_cancel_finance"))
								
								if not IsPedInAnyVehicle(player, true) and not FinanceInProgress then
									-- Complete Purchase:	
									if (IsControlJustPressed(0, Config.KeyToFinanceVeh) or IsDisabledControlJustPressed(0, Config.KeyToFinanceVeh)) then
										ESX.TriggerServerCallback('fivem_vehicleshop:GetFinancingMoney', function(hasUpfront, downPayment, carPrice, commission, payment)
											if hasUpfront then
												FinanceInProgress = true
												local VehCoords = nil
												local Heading = 0
												Heading = HeadingToSpawnAt
												VehCoords = VehicleCoordsToSpawnAt
												SpawnFinancedVehicle(currentModel, VehCoords, Heading, player, downPayment, carPrice, commission, payment)
												Financed = true
											else
												ShowNotifyESX(_U("veh_not_enough_money"))
												Citizen.Wait(250)
												FinanceInProgress = false
												Financed = true
											end
										end, currentDownpayment, currentModel, currentStock)
									-- Cancel Purchase:	
									elseif (IsControlJustPressed(0, Config.KeyToCancelFinance) or IsDisabledControlJustPressed(0, Config.KeyToCancelFinance)) then
										Citizen.Wait(500)
										ShowNotifyESX(_U('veh_purchase_cancel'))
										FinanceInProgress = false
										Financed = true
									end
								end
							else
								Financed = true
							end
						end
					else
						ShowNotifyESX(_U("veh_not_in_stock"))
					end
					
				-- CHANGE DOWNPAYMENT PERCENTS:
				elseif IsControlJustPressed(0, Config.KeyToChangeDownPay) and not ChangingValues then
					if PlayerData.job ~= nil and PlayerData.job.name == Config.CarDealerJobLabel then
						ChangingValues = true
						local carDist2,carPos2,carModel2,carID2 = GetClosestVehDisplay(coords)
						if carDist2 then
							ChangingValues = true
							ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'cardealer_downpayment_change', {
								title = "Enter Downpayment Value"
							},
							function(data, menu)
								menu.close()
								local amount = tonumber(data.value)
								if amount == nil or amount == '' then
									ShowNotifyESX(_U('invalid_amount'))
									ChangingValues = false
								else
									if amount < Config.MinDownpayment or amount > Config.MaxDownpayment then
										ShowNotifyESX("Min/Max Downpayment Error")
										ChangingValues = false
									else
										TriggerServerEvent('fivem_vehicleshop:ChangeDownpaymentSV', currentModel, amount, carID2)
										exports['progressBars']:startUI(500, "APPLYING CHANGES")
										Citizen.Wait(500)
										ChangingValues = false
										ESX.UI.Menu.CloseAll()
									end
								end
							end,
							function(data, menu)
								menu.close()
								ChangingValues = false	
							end)
						end
					end
					
				-- DRAW TEXTS:		
				else
					DrawTextOptions(carPos,currentName,currentDownpayment,currentCommission,swapCar,currentPrice,currentStock)
				end	
			end
	end
	
end)
-- Job NPC Thread Function:
Citizen.CreateThread(function()
	Citizen.Wait(2500)
	while true do
        Citizen.Wait(1)
		local player = GetPlayerPed(-1)
		local coords = GetEntityCoords(player)
		
		for k,v in pairs(Config.ShopMenu) do
			local dist = GetDistanceBetweenCoords(v.Pos[1], v.Pos[2], v.Pos[3], coords.x, coords.y, coords.z, false)
			local mk = v.Marker
			if mk.Enable and dist <= mk.DrawDist and not menuOpen then
				DrawMarker(mk.Type, v.Pos[1], v.Pos[2], v.Pos[3]-0.97, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, mk.Scale.x, mk.Scale.y, mk.Scale.z, mk.Color.r, mk.Color.g, mk.Color.b, mk.Color.a, false, true, 2, false, false, false, false)
			end
			if dist <= 1.5 and not menuOpen then
				DrawText3Ds(v.Pos[1], v.Pos[2], v.Pos[3]+0.2, _U('open_shop_menu'))
				if IsControlJustPressed(0, v.Key) then
					OpenShopMainMenu()
					Citizen.Wait(250)
				end
			end
		end
		if (PlayerData.job) ~= nil then 
			if (PlayerData.job.name == Config.CarDealerJobLabel) then 
				if PlayerData.job.grade >= Config.BossGrade then
					for k,v in pairs(Config.BossMenu) do
						local dist = GetDistanceBetweenCoords(v.Pos[1], v.Pos[2], v.Pos[3], coords.x, coords.y, coords.z, false)
						local mk = v.Marker
						if mk.Enable and dist <= mk.DrawDist and not menuOpen then
							DrawMarker(mk.Type, v.Pos[1], v.Pos[2], v.Pos[3]-0.97, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, mk.Scale.x, mk.Scale.y, mk.Scale.z, mk.Color.r, mk.Color.g, mk.Color.b, mk.Color.a, false, true, 2, false, false, false, false)
						end
						if dist <= 1.5 and not menuOpen then
							DrawText3Ds(v.Pos[1], v.Pos[2], v.Pos[3]+0.2, _U('boss_menu'))
							if IsControlJustPressed(0, v.Key) then
								OpenBossMenu()
								Citizen.Wait(250)
							end
						end
					end
				end
			end
		end
		if IsPedInAnyVehicle(player, false) then
			for k,v in pairs(Config.SellCarSpot) do
				local dist = GetDistanceBetweenCoords(v.Pos[1], v.Pos[2], v.Pos[3], coords.x, coords.y, coords.z, false)
				local mk = v.Marker
				if mk.Enable and dist <= mk.DrawDist and not menuOpen then
					DrawMarker(mk.Type, v.Pos[1], v.Pos[2], v.Pos[3]-0.97, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, mk.Scale.x, mk.Scale.y, mk.Scale.z, mk.Color.r, mk.Color.g, mk.Color.b, mk.Color.a, false, true, 2, false, false, false, false)
				end
				if dist <= 1.7 and not menuOpen then
					DrawText3Ds(v.Pos[1], v.Pos[2], v.Pos[3]+0.2, _U('open_sell_menu'))
					if IsControlJustPressed(0, v.Key) then
						OpenVehicleSaleMenu()
						Citizen.Wait(250)
					end
				end
			end
		end
	end
end)

TestDriving = false
TestVehicle = nil
TestID = 0

-- Function to Test Drive Display Vehicles:
function TestDriveVehicleFunction(currentModel, selectedID)
	if TestVehicle == nil and not TestDriving then
		local player = GetPlayerPed(-1)
		ShowNotifyESX(_U("test_veh_spawned"))
		TestDriving = true
		local VehCoords = nil
		local Heading = 0
		Heading = HeadingToSpawnAt
		VehCoords = VehicleCoordsToSpawnAt
		local plateText = "PDM"
		SpawnTestDriveVeh(currentModel, VehCoords, Heading, plateText)
	else
		ShowNotifyESX(_U("already_test_driving"))
	end
end

-- Thread for test drive session:
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if TestDriving and TestVehicle ~= nil and TestID ~= 0 then
			local player = GetPlayerPed(-1)
			local coords = GetEntityCoords(player)
			for k,v in pairs(Config.TestReturn) do
				local Pos = nil
				if TestID ~= 9 then
					Pos = vector3(VehicleCoordsToSpawnAt.x,VehicleCoordsToSpawnAt.y,VehicleCoordsToSpawnAt.z)
				else
					Pos = v.BigPos
				end
				Mk = v.Marker
				if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Pos[1], Pos[2], Pos[3], false) <= Mk.DrawDist then
					if Mk.Enable then
						DrawMarker(Mk.Type, Pos[1], Pos[2], Pos[3]-0.97, 0.0, 0.0, 0.0, 180.0, 0.0, 0.0, Mk.Scale.x, Mk.Scale.y, Mk.Scale.z, Mk.Color.r, Mk.Color.g, Mk.Color.b, Mk.Color.a, false, true, 2, false, false, false, false)
					end
					if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Pos[1], Pos[2], Pos[3], false) <= v.DrawText then
						DrawText3Ds(Pos[1], Pos[2], Pos[3]+0.2, _U('return_test_veh'))
						if IsControlJustPressed(0, v.Key) then
							
							local vehSeats = GetVehicleMaxNumberOfPassengers(TestVehicle)
							for i = -1, vehSeats do
								local pedInVeh = GetPedInVehicleSeat(TestVehicle,i)
								if pedInVeh ~= 0 then
									TaskLeaveVehicle(pedInVeh,TestVehicle,4160)
								end
							end
							if DoesEntityExist(TestVehicle) then
								SetVehicleUndriveable(TestVehicle, true)
								SetVehicleForwardSpeed(TestVehicle, 0)
								SetVehicleEngineOn(TestVehicle, false, false, true)
								SetVehicleDoorsLockedForAllPlayers(TestVehicle, true)
							end
							FreezeEntityPosition(TestVehicle, true)
							ShowNotifyESX(_U("test_veh_returned"))
							Citizen.Wait(1500)
							ESX.Game.DeleteVehicle(TestVehicle)
							TestDriving = false
							TestVehicle = nil
							TestID = 0
						end
					end	
				end	
			end
		end
	end
end) 

-- Function to replace display vehicles, sorted by category:
function OpenReplaceMainMenu(curID)
	menuOpen = true
	local elements = {}
	ESX.TriggerServerCallback('fivem_vehicleshop:FetchCategories', function(categories)
		for k,v in pairs(categories) do
			if curID == 9 then 	
				if v.name == "utility" or v.name == "offroad" or v.name == "vans" then
					table.insert(elements,{ label = v.label, name = v.name})
				end
			elseif curID == 8 then
				if v.name == "bicycles" then
					table.insert(elements,{ label = v.label, name = v.name})
				end	
			elseif curID == 1 then
				if v.name == "compacts" then
					table.insert(elements,{ label = v.label, name = v.name})
				end	
			elseif curID == 2 then
				if v.name == "motorcycles" then
					table.insert(elements,{ label = v.label, name = v.name})
				end
			elseif curID == 7 then
				if v.name == "suvs" then
					table.insert(elements,{ label = v.label, name = v.name})
				end
			elseif curID == 10 then
				if v.name == "super" then
					table.insert(elements,{ label = v.label, name = v.name})
				end
			else
				if v.name == "coupes" or v.name == "muscle" or v.name == "sedans" or v.name == "sports" or v.name == "sportsclassics" or v.name == "super" then
					table.insert(elements,{ label = v.label, name = v.name})
				end
			end
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), "cardealer_replace_menu",
			{
				title    = "PDM Replace Menu",
				align    = "top-left",
				elements = elements
			},
		function(data, menu)
			menu.close()
			OpenCategoryMenu(data.current, curID)
		end, function(data, menu)
			menu.close()
			ESX.UI.Menu.CloseAll()
			menuOpen = false
		end)
	end)
end

-- Function to open selected category:
function OpenCategoryMenu(selectedCategory, currentID)
	local elements = {}
	for k,v in pairs(vehicles) do
		if v.category == selectedCategory.name then
			table.insert(elements,{label = v.name..": [$"..v.price.."]", model = v.model, name = v.name, price = v.price, category = v.category, stock = v.stock})
		end
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "cardealer_category_menu",
		{
			title    = "PDM: "..selectedCategory.label,
			align    = "top-left",
			elements = elements
		},
	function(data, menu)
		menu.close()
		menuOpen = false
		ESX.UI.Menu.CloseAll()
		TriggerServerEvent('fivem_vehicleshop:ReplaceVehSV', data.current.model, data.current.name, currentID)
	end, function(data, menu)
		menu.close()
		menuOpen = false
		ESX.UI.Menu.CloseAll()
	end)
end

-- Function for Shop Menu:
function OpenShopMainMenu()
	menuOpen = true
	FreezeEntityPosition(GetPlayerPed(-1), true)		
	
	ESX.TriggerServerCallback('fivem_vehicleshop:GetDealerCount', function(DealerOnline)
		local DealerCount = DealerOnline
		
		local elements = {
			{ label = _U('billing_btn'), value = "open_billing_menu" },
			--{ label = _U('sell_veh_btn'), value = "open_sell_veh_menu" },
		}
				
		if Config.BuyVehWhenNoDealers then
			--if DealerCount == false then
				table.insert(elements,{label = _U('veh_catalog_btn'), value = "open_catalog_menu"})
			--end
		end
		
		if Config.CarInsuranceScript then
			table.insert(elements,{label = _U('veh_insurance_btn'), value = "open_insurance_menu"})
		end
				
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), "cardealer_shop_menu",
			{
				title    = _U('shop_menu_title'),
				align    = "top-left",
				elements = elements
			},
		function(data, menu)
			if data.current.value == "open_catalog_menu" then
				OpenShopCatalogMenu()
			elseif data.current.value == "open_billing_menu" then
				OpenShopBillingMenu()
			elseif data.current.value == "open_insurance_menu" then
				menuOpen = false
				TriggerEvent("fivem_carinsurance:openMenu")
			end
			menu.close()
		end, function(data, menu)
			menu.close()
			ESX.UI.Menu.CloseAll()
			menuOpen = false
			FreezeEntityPosition(GetPlayerPed(-1), false)
		end)
	
	end)	
end

function OpenVehicleSaleMenu()
	local plyPed = GetPlayerPed(-1)
	local coords = GetEntityCoords(plyPed, true)
	local car = nil
	if IsPedInAnyVehicle(plyPed, false) then
		car = GetVehiclePedIsIn(plyPed, false)
	end
	local carPlate = GetVehicleNumberPlateText(car)
	local carHash = GetEntityModel(car)

	ESX.TriggerServerCallback('fivem_vehicleshop:GetOwnedVehicleToSell', function(sellCarData)
		
		if sellCarData ~= nil then
		
			local sellCarPrice = 0
			local sellCarFinance = 0
			local sellCarPlate = ''
			local sellCarModel = nil

			for k,v in pairs(sellCarData) do
				sellCarPrice = v.price
				sellCarFinance = v.finance
				sellCarPlate = v.plate
				sellCarModel = v.model
			end

			local displaySellPrice = math.floor((sellCarPrice * (1-(Config.SellPercent/100))))

			if sellCarFinance < 1 then 
				-- Confirm Menu:
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), "cardealer_veh_sale_confirm",
					{
						title    = "Sell for: "..displaySellPrice.."?",
						align    = "top-left",
						elements = {
							{label = _U('no'), value = 'no'},
							{label = _U('yes'), value = 'yes'}
						}
					}, function(data, menu)
					if data.current.value == "yes" then
						-- SELL THE SELECTED VEHICLE:
						local vehPlate = sellCarPlate
						local vehModel = sellCarModel
						local vehPrice = sellCarPrice
						ESX.TriggerServerCallback('fivem_vehicleshop:SellOwnedVehicle', function(sold, sellPrice, plate, model)
							if sold then
								ShowNotifyESX(_U('shop_sell_msg', math.floor(sellPrice)))
								GetVehicleDoorLockStatus(car,2)
								DeleteVehicle(car)
								ShowNotifyESX(_U('shop_sell_veh_taken'))
							end
						end, vehPlate, vehPrice, vehModel)
						---
						--GetCarDealerData()
						GetDisplayCarData()
						menu.close()
						ESX.UI.Menu.CloseAll()
						menuOpen = false
						FreezeEntityPosition(GetPlayerPed(-1), false)
					elseif data.current.value == "no" then
						menu.close()
					end
				end, function(data, menu)
					menu.close()
				end)
			else
				ShowNotifyESX(_U('still_owe_money'))
			end
		else
			ShowNotifyESX(_U('not_able_to_sell'))
		end
	end, carPlate)
end

function OpenShopBillingMenu()
	ESX.TriggerServerCallback('fivem_vehicleshop:GetAllOwnedVehicles', function(results)
	
		local elements = {}
		for k,v in pairs(results) do
			table.insert(elements,{label = v.plate, plate = v.plate, vehicle = vehicle, date = v.date, price = v.price, finance = v.finance, repaytime = v.repaytime, model = v.model})
		end
		
		exports['progressBars']:startUI(1000, _U('progbar_retrieve_bills'))
		Citizen.Wait(1000)
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), "cardealer_financing_bills",
			{
				title    = _U('shop_finance_title'),
				align    = "top-left",
				elements = elements
			},
		function(data, menu)
			menu.close()
			PayFinancialBill(data.current.plate, data.current.price, data.current.model, data.current.finance, data.current.repaytime)
		end, function(data, menu)
			menu.close()
			OpenShopMainMenu()
		end)
		
	end, "financing")
end

function PayFinancialBill(plate,price,model,finance,repaytime)	
	local vehPlate, vehPrice, vehModel, vehFinance, vehRepaytime = plate, price, model, finance, repaytime
	
	local diffFP = (vehFinance / vehPrice)
	local repayMoney = ((vehPrice * diffFP) / Config.AmountOfRepayments)				
	local difference = 0
	
	if vehFinance > vehPrice then
		difference = (vehFinance - vehPrice) + repayMoney
	else
		difference = repayMoney
	end
	local titleLabel = _U('repay_dialog_title', comma_value(math.floor(difference)))
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'shop_repayment_amount', {
		title = "Repay Amount [Min: $"..comma_value(math.floor(difference)).."]"
	},
	function(data, menu)
		menu.close()
		local amount = tonumber(data.value)
		
		if amount < difference then
			ShowNotifyESX(_U('min_repayment', math.floor(difference)))
			PayFinancialBill(plate,price,model,finance,repaytime)
		else
			ESX.TriggerServerCallback('fivem_vehicleshop:RepayAmount', function(hasPaid) 
				if hasPaid then 
					ShowNotifyESX(_U('paid_fin_bill', math.floor(amount)))
				else 
					ShowNotifyESX(_U('not_enough_money'))
				end
			end, vehPlate, amount)
			
			ESX.UI.Menu.CloseAll()
			menuOpen = false
			FreezeEntityPosition(GetPlayerPed(-1), false)
		end
	end,
	function(data, menu)
		menu.close()
		OpenShopBillingMenu()		
	end)
	
end

function OpenShopCatalogMenu()
	local elements = {}
	ESX.TriggerServerCallback('fivem_vehicleshop:FetchCategories', function(categories)
		for k,v in pairs(categories) do
			table.insert(elements,{ label = v.label, name = v.name})
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), "cardealer_shop_categories",
			{
				title    = _U('shop_catalog'),
				align    = "top-left",
				elements = elements
			},
		function(data, menu)
			menu.close()
			OpenShopCategoryMenu(data.current)
		end, function(data, menu)
			menu.close()
			OpenShopMainMenu()
		end)
	end)
end

function OpenShopCategoryMenu(category)
	local elements = {}
	for k,v in pairs(vehicles) do
		if v.category == category.name then
			table.insert(elements,{label = v.name..": [$"..tonumber(math.floor(v.price*((Config.CommissionPercent/100)+1))).."]", model = v.model, name = v.name, price = tonumber(math.floor(v.price*((Config.CommissionPercent/100)+1))), category = v.category, stock = v.stock})
		end
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "cardealer_shop_vehicle_list",
		{
			title    = _U('shop_veh_list', category.label),
			align    = "top-left",
			elements = elements
		},
	function(data, menu)
		if data.current.stock > 0 then
			BuyShopMenuCar(data.current, data.current.category, category)
		else
			ShowNotifyESX(_U('veh_not_in_stock'))
		end
		--OpenShopCatalogMenu()
	end, function(data, menu)
		menu.close()
		OpenShopCatalogMenu()
	end)
end

function BuyShopMenuCar(buyVeh, vehGroup, category)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "cardealer_shop_confirm",
		{
			title    = _U('shop_veh_confirm'),
			align    = "top-left",
			elements = {
				{label = _U('no'), value = 'no'},
				{label = _U('yes'), value = 'yes'}
			}
		}, function(data, menu)
		if data.current.value == "yes" then
			-- BUY THE VEHICLE:
			local veh = buyVeh
			local vehModel = veh.model
			local vehPrice = veh.price
			ESX.TriggerServerCallback('fivem_vehicleshop:ShopGetPlyMoney', function(gotMoney, price, payment)
				if gotMoney then
					local VehCoords = nil
					local Heading = 0
					Heading = HeadingToSpawnAt
					VehCoords = VehicleCoordsToSpawnAt
					Citizen.Wait(250)
					ESX.Game.SpawnVehicle(vehModel,VehCoords,Heading, function(purchCar)
						Citizen.Wait(10)
						SetEntityCoords(purchCar, VehCoords.x,VehCoords.y,VehCoords.z, 0.0, 0.0, 0.0, true)
						SetEntityHeading(purchCar, Heading)
						SetVehicleOnGroundProperly(purchCar)
						Citizen.Wait(10)
						if Config.WarpPlayerIntoVeh then
							TaskWarpPedIntoVehicle(player, purchCar, -1)
						end
						-- Generate Plate:
						local numberPlate = ProduceNumberPlate()
						local vehProps = ESX.Game.GetVehicleProperties(purchCar)
						vehProps.plate = numberPlate
						SetVehicleNumberPlateText(purchCar, numberPlate)
						-- end
						TriggerServerEvent('fivem_vehicleshop:ShopBuyAddCarToDB', vehProps, price, payment, vehModel)
						--GetCarDealerData()
						GetDisplayCarData()
						ShowNotifyESX(_U('veh_purchased'))
					end)										
				else
					ShowNotifyESX(_U("veh_not_enough_money"))
				end
			end, vehModel, vehPrice)
			---
			menu.close()
			ESX.UI.Menu.CloseAll()
			menuOpen = false
			FreezeEntityPosition(GetPlayerPed(-1), false)
		elseif data.current.value == "no" then
			menu.close()
			OpenShopCategoryMenu(category)
		end
	end, function(data, menu)
		menu.close()
		OpenShopCategoryMenu(category)
	end)
end

-- Dealer Data:
function GetCarDealerData()
	ESX.TriggerServerCallback("fivem_vehicleshop:FetchData", function(data1, data2, data3)
		vehicles = nil
		display = nil
		Wait(0)
		vehicles = data1
		display = data2
	end)
end	

-- Function to Spawn Display Vehicles from DB:
function SpawnDisplayVeh()
	DisplayCars = {}
	local playerPed = GetPlayerPed(-1)
	local coords = GetEntityCoords(playerPed)
	local spot = Config.DealerPos	
	ClearAreaOfVehicles(spot[1], spot[2], spot[3], 25.0, false, false, false, false, false)
	
	Citizen.Wait(1000)
	
	local syncPos = vector3(coords.x, coords.y, coords.z + 50.0)
	for k,v in pairs(Config.DisplayCars) do
	
		local hash = GetHashKey(display[k].model)  
		
		while not HasModelLoaded(hash) do
			Citizen.Wait(10)
			RequestModel(hash)
		end
		
		ESX.Game.SpawnLocalVehicle(hash, syncPos, v.Heading, function(carDisplay)
			Citizen.Wait(50)
			SetEntityCoords(carDisplay, v.Pos[1], v.Pos[2], v.Pos[3]-0.97, 0.0, 0.0, 0.0, true)
			SetEntityHeading(carDisplay, v.Heading)
			SetEntityAsMissionEntity(carDisplay, true, true)
			SetVehicleOnGroundProperly(carDisplay)
			Citizen.Wait(50)
			FreezeEntityPosition(carDisplay, true)
			SetEntityInvincible(carDisplay, true)
			SetVehicleDoorsLocked(carDisplay, 2)
			DisplayCars[k] = carDisplay
		end)
		
		SetModelAsNoLongerNeeded(hash)
	end
end

-- Function to replace the vehicle:
function ReplaceVehicle(car, currentID)
	local player = GetPlayerPed(-1)
	--GetDisplayCarData()
	local coords = GetEntityCoords(player)
	local vehSpawn = Config.DisplayCars[currentID]
	while not vehSpawn do vehSpawn = Config.DisplayCars[currentID]; Wait(0); end
	local hash = GetHashKey(car)
	ESX.Game.DeleteVehicle(DisplayCars[currentID])
	
	while not HasModelLoaded(hash) do
		Citizen.Wait(10)
		RequestModel(hash)
	end
	
	local VehCoords = {x = vehSpawn.Pos[1], y = vehSpawn.Pos[2], z = vehSpawn.Pos[3]}
	local VehHeading = vehSpawn.Heading
	
	ESX.Game.SpawnLocalVehicle(hash, VehCoords, VehHeading, function(newCar)
		Citizen.Wait(50)
		SetEntityCoords(newCar, VehCoords.x, VehCoords.y, VehCoords.z, 0.0, 0.0, 0.0, true)
		SetEntityHeading(newCar, VehHeading)
		SetEntityAsMissionEntity(newCar, true, true)
		SetVehicleOnGroundProperly(newCar)
		Citizen.Wait(50)
		FreezeEntityPosition(newCar, true)
		SetEntityInvincible(newCar, true)
		SetVehicleDoorsLocked(newCar, 2)
		DisplayCars[currentID] = newCar
		Citizen.Wait(50)
		SetModelAsNoLongerNeeded(hash)
	end)
	GetCarDealerData()
end

-- Spawns purchased vehicle:
function SpawnPurchasedVehicle(currentModel, VehCoords, Heading, player, carPrice, carCommission, price, payment)
	ESX.Game.SpawnVehicle(currentModel,VehCoords,Heading, function(boughtCar)
		Citizen.Wait(10)
		SetEntityCoords(boughtCar, VehCoords.x,VehCoords.y,VehCoords.z, 0.0, 0.0, 0.0, true)
		SetEntityHeading(boughtCar, Heading)
		SetVehicleOnGroundProperly(boughtCar)
		Citizen.Wait(10)
		if Config.WarpPlayerIntoVeh then
			TaskWarpPedIntoVehicle(player, boughtCar, -1)
		end	
		-- Generate Plate:
		local numberPlate = ProduceNumberPlate()
		local vehProps = ESX.Game.GetVehicleProperties(boughtCar)
		vehProps.plate = numberPlate
		SetVehicleNumberPlateText(boughtCar, numberPlate)
		-- end
		GetCarDealerData()
		--GetDisplayCarData()
		TriggerServerEvent('fivem_vehicleshop:AddVehToDatabase', vehProps, carPrice, carCommission, price, payment, currentModel)
		ShowNotifyESX(_U('veh_purchased'))
		BuyInProgress = false
	end)
end

-- Spawns Financed Vehicle:
function SpawnFinancedVehicle(currentModel, VehCoords, Heading, player, downPayment, carPrice, commission, payment)
	ESX.Game.SpawnVehicle(currentModel,VehCoords,Heading, function(financedCar)
		Citizen.Wait(10)
		SetEntityCoords(financedCar, VehCoords.x,VehCoords.y,VehCoords.z, 0.0, 0.0, 0.0, true)
		SetEntityHeading(financedCar, Heading)
		SetVehicleOnGroundProperly(financedCar)
		Citizen.Wait(10)
		if Config.WarpPlayerIntoVeh then
			TaskWarpPedIntoVehicle(player, financedCar, -1)
		end
		-- Generate Plate:
		local numberPlate = ProduceNumberPlate()
		local vehProps = ESX.Game.GetVehicleProperties(financedCar)
		vehProps.plate = numberPlate
		SetVehicleNumberPlateText(financedCar, numberPlate)
		-- end
		GetCarDealerData()
		TriggerServerEvent('fivem_vehicleshop:AddFinancedVehToDB', vehProps, downPayment, carPrice, commission, payment, currentModel)
		ShowNotifyESX(_U('veh_purchased'))
		FinanceInProgress = false
	end)
end

-- Spawns Test Drive Vehicle:
function SpawnTestDriveVeh(currentModel, VehCoords, Heading, plateText)
	ESX.Game.SpawnVehicle(currentModel, VehCoords, Heading, function(testVeh)
		Citizen.Wait(50)
		SetEntityCoords(testVeh, VehCoords.x, VehCoords.y, VehCoords.z, 0.0, 0.0, 0.0, true)
		SetEntityHeading(testVeh, Heading)
		SetVehicleOnGroundProperly(testVeh)
		Citizen.Wait(50)
		if Config.WarpPlyIntoTestVeh then
			TaskWarpPedIntoVehicle(player, testVeh, -1)
		end
		SetVehicleNumberPlateText(testVeh, plateText)
		TestVehicle = testVeh
		TestID = currentID
	end)
end

-- Get Closest Display Vehicle:
function GetClosestVehDisplay(coords)
	local carDist,carPos,carModel,carID
	-- Loop through Display Cars:
	if not display then print("Not display veh") return false; end
	for k,v in pairs(Config.DisplayCars) do
		if display[k] then
			local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, v.Pos[1], v.Pos[2], v.Pos[3], false)
			if not carDist or distance < carDist then
				carDist = distance
				carPos = v.Pos
				carModel = display[k].model
				carID = k
			end
		end
	end
	if not carDist or not carModel then
		return false
	end
	return carDist,carPos,carModel,carID
end

-- Function for Boss Menu:
function OpenBossMenu()
	menuOpen = true
	FreezeEntityPosition(GetPlayerPed(-1), true)
	local jobNameDB = Config.CarDealerJobLabel
	local elements = {
		{ label = _U('employee_menu'), value = "open_employee_menu" },
		{ label = _U('accounts_menu'), value = "open_accounts_menu" },
	}
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "cardealer_boss_menu",
		{
			title    = _U('boss_menu_title'),
			align    = "top-left",
			elements = elements
		},
	function(data, menu)
		if data.current.value == "open_employee_menu" then
			OpenEmployeesMenu(jobNameDB)
		elseif data.current.value == "open_accounts_menu" then
			OpenAccountsMenu()
		end
		menu.close()
	end, function(data, menu)
		menu.close()
		ESX.UI.Menu.CloseAll()
		menuOpen = false
		FreezeEntityPosition(GetPlayerPed(-1), false)
	end)
		
end

-- Function to Open Employee Menu
function OpenEmployeesMenu(jobNameDB)
	local elements = {
		{ label = _U('btn_employee_list'), value = "open_employee_list" },
		{ label = _U('btn_employee_reqruit'), value = "open_reqruit_menu" },
	}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "cardealer_employee_menu",
		{
			title    = _U('employee_menu_title'),
			align    = "top-left",
			elements = elements
		},
	function(data, menu)
		menu.close()
		-- EMPLOYEE MENU:
		if data.current.value == "open_employee_list" then
			ESX.TriggerServerCallback('fivem_vehicleshop:getEmployees', function(employees)
				local elements = {
					head = {_U('employee'), _U('grade'), _U('actions')},
					rows = {}
				}
				for i=1, #employees, 1 do
					local gradeLabel = (employees[i].job.grade_label == '' and employees[i].job.label or employees[i].job.grade_label)

					table.insert(elements.rows, {
						data = employees[i],
						cols = {
							employees[i].name,
							gradeLabel,
							'{{' .. _U('promote') .. '|promote}} {{' .. _U('fire') .. '|fire}}'
						}
					})
				end
				ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'cardealer_employee_list_' .. jobNameDB, elements, function(data2, menu2)
					local employee = data2.data
					-- PROMOTE MENU:
					if data2.value == 'promote' then
						menu2.close()
						ESX.TriggerServerCallback('fivem_vehicleshop:getJob', function(job)
							local elements = {}
							for i=1, #job.grades, 1 do
								local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)
								table.insert(elements, {
									label = gradeLabel,
									value = job.grades[i].grade,
									selected = (employee.job.grade == job.grades[i].grade)
								})
							end
							ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cardealer_promote_employee_' .. jobNameDB, {
								title    = _U('promote_employee', employee.name),
								align    = 'center',
								elements = elements
							}, function(data3, menu3)
								menu3.close()
								ShowNotifyESX(_U('you_have_promoted', employee.name, data3.current.label))

								ESX.TriggerServerCallback('fivem_vehicleshop:setJob', function()
									OpenEmployeesMenu(jobNameDB)
								end, employee.identifier, jobNameDB, data3.current.value, 'promote')
							end, function(data3, menu3)
								menu3.close()
								OpenEmployeesMenu(jobNameDB)
							end)
						end, jobNameDB)
					-- FIRE MENU:
					elseif data2.value == 'fire' then
						ShowNotifyESX(_U('you_have_fired', employee.name))

						ESX.TriggerServerCallback('fivem_vehicleshop:setJob', function()
							OpenEmployeesMenu(jobNameDB)
						end, employee.identifier, 'unemployed', 0, 'fire')
						menu2.close()
						OpenEmployeesMenu(jobNameDB)
					end
				end, function(data2, menu2)
					menu2.close()
					OpenEmployeesMenu(jobNameDB)
				end)
			end, jobNameDB)
		
		-- RECRUIT MENU:
		elseif data.current.value == "open_reqruit_menu" then
			ESX.TriggerServerCallback('fivem_vehicleshop:getOnlinePlayers', function(players)
				local elements = {}
				for i=1, #players, 1 do
					if players[i].job.name ~= jobNameDB then
						table.insert(elements, {
							label = players[i].name,
							value = players[i].source,
							name = players[i].name,
							identifier = players[i].identifier
						})
					end
				end
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cardealer_recruit_' .. jobNameDB, {
					title    = _U('recruiting'),
					align    = 'center',
					elements = elements
				}, function(data2, menu2)
					-- YES / NO OPTION:
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cardealer_recruit_confirm_' .. jobNameDB, {
						title    = _U('recruit_player', data2.current.name),
						align    = 'center',
						elements = {
							{label = _U('no'),  value = 'no'},
							{label = _U('yes'), value = 'yes'}
						}
					}, function(data3, menu3)
						menu2.close()
						if data3.current.value == 'yes' then
							ShowNotifyESX(_U('you_have_hired', data2.current.name))

							ESX.TriggerServerCallback('fivem_vehicleshop:setJob', function()
								OpenEmployeesMenu(jobNameDB)
							end, data2.current.identifier, jobNameDB, 0, 'hire')
						end
					end, function(data3, menu3)
						menu3.close()
						OpenEmployeesMenu(jobNameDB)
					end)

				end, function(data2, menu2)
					menu2.close()
					OpenEmployeesMenu(jobNameDB)
				end)
			end)
		end
	end, function(data, menu)
		menu.close()
		OpenBossMenu()
	end)
end

-- Function To Open Account Menu:
function OpenAccountsMenu()
	local elements = {
		{ label = _U('btn_withdraw'), value = 1, title = _U('amount_withdraw') },
		{ label = _U('btn_deposit'), value = 2, title = _U('amount_deposit') },
	}
	ESX.TriggerServerCallback('fivem_vehicleshop:GetAccountMoney', function(accountMoney,moneyOnPlayer)
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), "cardealer_accounts_menu",
			{
				title    = _U('accounts_menu_title', accountMoney),
				align    = "top-left",
				elements = elements
			},
		function(data, menu)
			OpenAccountsDialog(data.current.value, data.current.title, accountMoney, moneyOnPlayer)
			menu.close()
		end, function(data, menu)
			menu.close()
			OpenBossMenu()
		end)
		
	end)
end

-- Function for Accounts Dialog Menu:
function OpenAccountsDialog(option, label, accountMoney, moneyOnPlayer)
	local text = ''
	if option == 1 then
		text = label.." [Max: "..accountMoney.."]"
	elseif option == 2 then
		text = label.." [Max: "..moneyOnPlayer.."]"
	end
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'cardealer_accounts_dialog', {
		title    = text
	}, function(data, menu)
		local amount = tonumber(data.value)
		local callback, msg, progbar = '', '', ''
		if amount == nil or amount == '' then
			ShowNotifyESX(_U('invalid_amount'))
		else
			if option == 1 then
				callback = 'Withdraw'
				msg = _U('withdrew_amount', amount)
				progbar = _U('progbar_withdrawing')
			elseif option == 2 then
				callback = 'Deposit'
				msg = _U('deposited_amount', amount)
				progbar = _U('progbar_depositing')
			end
			ESX.TriggerServerCallback('fivem_vehicleshop:Accounts'..callback..'', function(approved)
				if approved then
					menu.close()
					exports['progressBars']:startUI(2000, progbar)
					Citizen.Wait(2000)
					ShowNotifyESX(msg)
					OpenAccountsMenu()
				else
					menu.close()
					ShowNotifyESX(_U('not_enough_money'))
					OpenAccountsMenu()
				end
			end, amount)
		end
	end,
	function(data, menu)
		menu.close()
		OpenAccountsMenu()		
	end)
end

-- REGISTRATION PAPER:
local open = false
RegisterNetEvent('fivem_vehicleshop:openRegCL')
AddEventHandler('fivem_vehicleshop:openRegCL', function(data, vehPlate)
	open = true
	SendNUIMessage({ action = "open", array  = data, plate = vehPlate })
end)
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, Config.KeyToHidePaper) and open then
			SendNUIMessage({
				action = "close"
			})
			open = false
		end
	end
end)