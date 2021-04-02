if Config.UseESX then
	ESX = nil

	Citizen.CreateThread(function()
		while ESX == nil do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
			Citizen.Wait(0)
		end

	end)
end

local entityEnumerator = {
    __gc = function(enum)
      if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
      end
      enum.destructor = nil
      enum.handle = nil
    end
  }
  
local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
        local iter, id = initFunc()
        if not id or id == 0 then
        disposeFunc(iter)
        return
        end
        
        local enum = {handle = iter, destructor = disposeFunc}
        setmetatable(enum, entityEnumerator)
        
        local next = true
        repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
        until not next
        
        enum.destructor, enum.handle = nil, nil
        disposeFunc(iter)
    end)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end
    return false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
		local vehicleClass = GetVehicleClass(vehicle)
		local vehicleCoords =  GetEntityCoords(PlayerPedId())
		local vehicleHeading = GetEntityHeading(vehicle)
		local checkCar = {}
		if Config.UseESX then
			checkCar = ESX.Game.GetVehiclesInArea(vehicleCoords, 14)
		else
			for car in EnumerateVehicles() do
				local cvehicleCoords =  GetEntityCoords(car)
				if GetDistanceBetweenCoords(vehicleCoords, cvehicleCoords, true) < 14 then
					table.insert(checkCar, car)
				end
			end
		end

		for i=1, #checkCar, 1 do
			for j = 1, #Config.Trailers, 1 do
				if GetHashKey(Config.Trailers[j].model) == GetEntityModel(checkCar[i]) then
					local trailerData = Config.Trailers[j]
					local trailer = checkCar[i]
					local trailerPos = GetEntityCoords(trailer)
					if not trailerData.Special then
						if not IsPedInAnyVehicle(PlayerPedId(),false) then
							for k = 1, #trailerData.unloadPos, 1 do
								local unloadPos = GetOffsetFromEntityInWorldCoords(trailer, trailerData.unloadPos[k])
								if GetDistanceBetweenCoords(vehicleCoords, unloadPos, true) < 4 then
									if Config.ShowMarkers then
										DrawMarker(Config.MarkerType, unloadPos, 0.0, 0.0, 0.0, 0.0, 0.0, 0, Config.BikeMarkerSize.x, Config.BikeMarkerSize.y, Config.BikeMarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, false, 2, nil, nil, false)
									end
									if GetDistanceBetweenCoords(vehicleCoords, unloadPos, true) < 1.5 then
										if Config.UseESX then
											ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to release vehicle")
											if IsDisabledControlJustPressed(0,86) then
												local elements = {}

												for attachedVeh in EnumerateVehicles() do
													local cvehicleCoords =  GetEntityCoords(attachedVeh)
													if GetDistanceBetweenCoords(vehicleCoords, cvehicleCoords, true) < 8 then
														if IsEntityAttached(attachedVeh) and attachedVeh ~= trailer then
															table.insert(elements, {label = GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(attachedVeh))), value = attachedVeh})
														end
													end
												end
												ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'attached_vehs', {
													title    = 'Attached Cars',
													align    = 'right',
													elements = elements
												}, function (data, menu)
													TaskWarpPedIntoVehicle(GetPlayerPed(-1), data.current.value, -1)
													menu.close()
												end, function (data, menu)
													menu.close()
												end)
											end
										else
											for car in EnumerateVehicles() do
												local avehicleCoords =  GetEntityCoords(car)
												if GetDistanceBetweenCoords(vehicleCoords, avehicleCoords, true) < 14 then
													if IsEntityAttached(car) and car ~= trailer then
														BeginTextCommandDisplayHelp("VEH_E_DETATCH")
														EndTextCommandDisplayHelp(0, 0, 1, -1)
														if IsDisabledControlJustPressed(0,86) then
															TaskWarpPedIntoVehicle(PlayerPedId(), car, -1)
														end
													end
												end
											end
										end
									end
								end
							end
							if trailerData.hasRamp then
								for k = 1, #trailerData.rampPos, 1 do
									local rampPos = GetOffsetFromEntityInWorldCoords(trailer, trailerData.rampPos[k])
									if Config.ShowMarkers and GetDistanceBetweenCoords(vehicleCoords, rampPos, true) < 5 then
										DrawMarker(Config.MarkerType, rampPos, 0.0, 0.0, 0.0, 0.0, 0.0, 0, Config.BikeMarkerSize.x, Config.BikeMarkerSize.y, Config.BikeMarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, false, 2, nil, nil, false)
									end
									if GetDistanceBetweenCoords(vehicleCoords, rampPos, true) < 1.5 then
										BeginTextCommandDisplayHelp("VEH_I_RAMP")
										EndTextCommandDisplayHelp(0, 0, 1, -1)
										
										if IsDisabledControlJustPressed(0,86) then
											local dooropen = 0.0
										
											if trailerData.doorwithRamp then
												for n = 1, #trailerData.doorwithRampNums, 1 do
													dooropen = GetVehicleDoorAngleRatio(trailer, trailerData.doorwithRampNums[n])
												end
											end
											if trailerData.isRampExtra then
												if IsVehicleExtraTurnedOn(trailer, trailerData.rampextraNum) then
													TriggerServerEvent('ebu:updateTrailer', 'extra', trailerData.rampextraNum, trailer, 'closed')
												else
													TriggerServerEvent('ebu:updateTrailer', 'extra', trailerData.rampextraNum, trailer, 'open')
												end
											else

												local trunkopen = GetVehicleDoorAngleRatio(trailer, trailerData.rampDoorNum)
												if trunkopen > 0.0 or dooropen > 0.0 then
													TriggerServerEvent('ebu:updateTrailer', 'door', trailerData.rampDoorNum, trailer, 'closed')

													if trailerData.doorwithRamp then
														for l = 1, #trailerData.doorwithRampNums, 1 do
															TriggerServerEvent('ebu:updateTrailer', 'door', trailerData.doorwithRampNums[l], trailer, 'closed')
															TriggerServerEvent('ebu:updateTrailer', 'extra', trailerData.rampextraNum, trailer, 'closed')
														end
													end
													dooropen = false

												else
													TriggerServerEvent('ebu:updateTrailer', 'door', trailerData.rampDoorNum, trailer, 'open')
													if trailerData.doorwithRamp then
														TriggerServerEvent('ebu:updateTrailer', 'extra', trailerData.rampextraNum, trailer, 'open')

														for l = 1, #trailerData.doorwithRampNums, 1 do
															TriggerServerEvent('ebu:updateTrailer', 'door', trailerData.doorwithRampNums[l], trailer, 'open')
														end
													end
												end
											end
										end
									end
								end
							end
						elseif has_value(Config.bikes, vehicleClass) then
							for k = 1, #trailerData.bikePositions, 1 do
								local offsetPos = GetOffsetFromEntityInWorldCoords(trailer, trailerData.bikePositions[k])
								if Config.ShowMarkers then
									DrawMarker(Config.MarkerType, offsetPos, 0.0, 0.0, 0.0, 0.0, 0.0, 0, Config.BikeMarkerSize.x, Config.BikeMarkerSize.y, Config.BikeMarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, false, 2, nil, nil, false)
								end
								if GetDistanceBetweenCoords(vehicleCoords, offsetPos, true) < 0.8 then
									DisableControlAction(0, 86, 1)

									BeginTextCommandDisplayHelp("VEH_E_DETATCH")
									EndTextCommandDisplayHelp(0, 0, 1, -1)

									if IsDisabledControlJustPressed(0,86) then
										local vehicleCoords =  GetEntityCoords(vehicle)
										local trailerheight = trailerPos.z
										local carheight = vehicleCoords.z
										local difference = carheight - trailerheight
										if IsEntityAttached(vehicle) then
											FreezeEntityPosition(vehicle, true)
											SetEntityCoords(vehicle, vehicleCoords.x, vehicleCoords.y, (vehicleCoords.z + difference + 1.7), 1, 1, 1, 0)
											FreezeEntityPosition(vehicle, false)
											DetachEntity(vehicle, 1, 1)
											SetEntityCanBeDamaged(vehicle, true)
										else
											if trailerData.closeTrunk then
												SetVehicleDoorShut(trailer, trailerData.rampDoorNum, false)	
											end
											
											AttachEntityToEntity(
												vehicle,
												trailer,
												GetEntityBoneIndexByName(vehicle, "chassis"),
												vector3(trailerData.bikePositions[k].x, trailerData.bikePositions[k].y, difference + trailerData.bikeHeightOffset),
												vector3(0.0, 0.0, 0.0),
												1, 0, 1, 0, 0, 1
											)
											SetEntityCanBeDamaged(vehicle, false)
											SetVehicleEngineOn(vehicle, false,false,false)
										end
									end
								end
							end
						elseif has_value(Config.cars, vehicleClass) and not IsVehicleAttachedToTrailer(vehicle) then
							for k = 1, #trailerData.carPositions, 1 do
								local offsetPos = GetOffsetFromEntityInWorldCoords(trailer, trailerData.carPositions[k])
								if Config.ShowMarkers then
									DrawMarker(Config.MarkerType, offsetPos, 0.0, 0.0, 0.0, 0.0, 0.0, 0, Config.CarMarkerSize.x, Config.CarMarkerSize.y, Config.CarMarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, false, 2, nil, nil, false)
								end
								if GetDistanceBetweenCoords(vehicleCoords, offsetPos, true) < 1 then
									DisableControlAction(0, 86, 1)
									BeginTextCommandDisplayHelp("VEH_I_AORD")
									EndTextCommandDisplayHelp(0, 0, 1, -1)
		
									if IsDisabledControlJustPressed(0,86) then
										local vehicleCoords =  GetEntityCoords(vehicle)
										local trailerheight = trailerPos.z
										local carheight = vehicleCoords.z
										local difference = carheight - trailerheight
										if IsEntityAttached(vehicle) then
											FreezeEntityPosition(vehicle, true)
											SetEntityCoords(vehicle, vehicleCoords.x, vehicleCoords.y, (vehicleCoords.z + difference + 1.7), 1, 1, 1, 0)
											FreezeEntityPosition(vehicle, false)
											DetachEntity(vehicle, 1, 1)
											Citizen.Wait(2000)
											SetEntityCanBeDamaged(vehicle, true)
										else
											local trunkopen = GetVehicleDoorAngleRatio(trailer, 5)
											if trailerData.closeTrunk and trunkopen > 0.0 then
												SetVehicleDoorShut(trailer, 5, false)	
											else
												
												AttachEntityToEntity(
													vehicle,
													trailer,
													GetEntityBoneIndexByName(trailer, "chassis"),
													vector3(trailerData.carPositions[k].x, trailerData.carPositions[k].y, difference + trailerData.carHeightOffset),
													vector3(0.0, 0.0, 0.0),
													1, 0, 1, 0, 0, 1
												)
												SetEntityCanBeDamaged(vehicle, false)
												SetVehicleEngineOn(vehicle, false,false,false)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end)

RegisterNetEvent('ebu:updateTrailer')
AddEventHandler('ebu:updateTrailer', function(type, num, vehicle, status)
	if type == 'extra' then
		if status == 'open' then
			SetVehicleExtra(vehicle, num, false)
		elseif status == 'closed' then
			SetVehicleExtra(vehicle, num, true)
		end
		SetVehicleFixed(vehicle)
		SetVehicleDeformationFixed(vehicle)
	elseif type == 'door' then
		if status == 'open' then
			SetVehicleDoorOpen(vehicle, num, false, false)
		elseif status == 'closed' then
			SetVehicleDoorShut(vehicle, num, false)
		end
	end
end)