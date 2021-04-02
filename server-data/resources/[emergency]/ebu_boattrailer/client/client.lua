

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

local inMarker = false
local inBoat = false

Citizen.CreateThread(function()
	while true do
        Citizen.Wait(0)
        
		local playerPed = GetPlayerPed(-1)
        local playerCoords =  GetEntityCoords(playerPed)
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        local checkboat = {}
        for boat in EnumerateVehicles() do
            local bvehicleCoords =  GetEntityCoords(boat)
            if GetDistanceBetweenCoords(playerCoords, bvehicleCoords, true) < 8 then
                table.insert(checkboat, boat)
            end
        end
		for i=1, #checkboat, 1 do
            for j = 1, #Config.Trailers, 1 do
                if GetHashKey(Config.Trailers[j].model) == GetEntityModel(checkboat[i]) then
					local trailerData = Config.Trailers[j]
					local trailer = checkboat[i]

                    if not IsPedInAnyVehicle(PlayerPedId(),false) then
                        inBoat = false
                        for k = 1, #trailerData.DetachPoints, 1 do
                            local detachPos = GetOffsetFromEntityInWorldCoords(trailer, trailerData.DetachPoints[k])
                            
                            if GetDistanceBetweenCoords(playerCoords, detachPos, true) < 1.5 then
                                inMarker = true
                                if IsDisabledControlJustPressed(0,86) then
                                    for boat in EnumerateVehicles() do
                                        for i =1, #trailerData.boats, 1 do
                                            if GetHashKey(trailerData.boats[i]) == GetEntityModel(boat) then
                                                local bvehicleCoords =  GetEntityCoords(boat)
                                                if GetDistanceBetweenCoords(playerCoords, bvehicleCoords, false) < 12 then
                                                    if IsEntityAttached(boat) and boat ~= trailer then
                                                        FreezeEntityPosition(boat, true)
                                                        SetEntityCoords(boat,trailerData.Position.x, trailerData.Position.y, (trailerData.HeightOffset  + 2.7), 1, 1, 1, 0)
                                                        FreezeEntityPosition(boat, false)
                                                        DetachEntity(boat, 1, 1)
                                                        Citizen.Wait(Config.InvulTime * 1000)
                                                        SetEntityCanBeDamaged(boat, true)
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            else
                                inMarker = false
                            end
                        end
                    elseif GetPedInVehicleSeat(vehicle, -1) == playerPed then
                        local vehicleCoords =  GetEntityCoords(vehicle)
                        for i =1, #trailerData.boats, 1 do
                            if GetHashKey(trailerData.boats[i]) == GetEntityModel(vehicle) then
                                local offsetPos = GetOffsetFromEntityInWorldCoords(trailer, trailerData.Position)
                                if GetDistanceBetweenCoords(vehicleCoords, offsetPos, true) < 2 then
                                    DisableControlAction(0, 86, 1)
                                    inBoat = true
                                    SetEntityCanBeDamaged(trailer, false)
                                    if IsDisabledControlJustPressed(0,86) then
                                        if IsEntityAttached(vehicle) then
                                            FreezeEntityPosition(vehicle, true)
                                            SetEntityCoords(vehicle,trailerData.Position.x, trailerData.Position.y, (trailerData.HeightOffset  + 2.7), 1, 1, 1, 0)
                                            FreezeEntityPosition(vehicle, false)
                                            DetachEntity(vehicle, 1, 1)
                                            Citizen.Wait(Config.InvulTime * 1000)
                                            SetEntityCanBeDamaged(vehicle, true)
                                            SetEntityCanBeDamaged(trailer, true)
                                        else
                                            AttachEntityToEntity( vehicle,trailer,GetEntityBoneIndexByName(trailer, "chassis"), vector3(trailerData.Position.x, trailerData.Position.y, trailerData.HeightOffset),vector3(0.0, 0.0, 0.0),1, 0, 1, 0, 0, 1)
                                            FreezeEntityPosition(vehicle, true)
                                            SetEntityCanBeDamaged(vehicle, false)
                                            SetVehicleEngineOn(vehicle, false,true,true)
                                        end
                                    end
                                else
                                    inBoat = false
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end)


CreateThread(function()
    while true do
        Wait(0)
        if inMarker then
            BeginTextCommandDisplayHelp("BOAT_E_DETATCH")
            EndTextCommandDisplayHelp(0, 0, 1, -1)
        elseif inBoat then
            BeginTextCommandDisplayHelp("BOAT_I_THING")
            EndTextCommandDisplayHelp(0, 0, 1, -1)
        end
    end
end)
