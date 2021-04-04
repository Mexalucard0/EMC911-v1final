local currentWeapon
local currentWeaponSlot
local currentWepAttachs = {}
local firsttime = true
local weaponKey = nil
local NumberCharset = {}
local Charset = {}
canFire = true

RegisterNetEvent('DP_Inventory:itemPopUp')
AddEventHandler('DP_Inventory:itemPopUp', function(weapon)
    if currentWeapon == weapon then
        RemoveWeapon(currentWeapon)
        currentWeapon = nil
        currentWeaponSlot = nil
        return
    elseif currentWeapon ~= nil then
        RemoveWeapon(currentWeapon)
        currentWeapon = nil
        currentWeaponSlot = nil
    end
    currentWeapon = weapon
    GiveWeapon(currentWeapon)
    TriggerEvent('DP_Inventory:notification', weapon, _U("weapon_used"), 1, false)
end)

AddEventHandler('DP_Inventory:addCurrentWeapon', function(waeponToAdd, attachments, addToSlote)
    currentWeapon = waeponToAdd
    currentWepAttachs = attachments.attach
    local doBreak = false
    if addToSlote then
        TriggerServerEvent('DP_Inventory:slotPut', waeponToAdd)
    end
end)

RegisterNetEvent('DP_Inventory:removeCurrentWeapon')
AddEventHandler('DP_Inventory:removeCurrentWeapon', function()
    if currentWeapon ~= nil then
        RemoveWeapon(currentWeapon)
        currentWeapon = nil
        currentWeaponSlot = nil
    end
end)

local weapons = {
    [tostring(GetHashKey('weapon_combatpistol'))] = {
        ['mag'] = GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_PI_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_PI_SUPP'),
    },
        
    [tostring(GetHashKey('weapon_pistol'))] = {
        ['mag'] = GetHashKey('COMPONENT_PISTOL_CLIP_02'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_PI_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_PI_SUPP_02'),
    },
        
    [tostring(GetHashKey('weapon_pistol_mk2'))] = {
        ['mag'] = GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_PI_RAIL'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_PI_FLSH_02'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_PI_SUPP_02'),
    },
        
    [tostring(GetHashKey('weapon_appistol'))] = {
        ['mag'] = GetHashKey('COMPONENT_APPISTOL_CLIP_02'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_PI_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_PI_SUPP'),
    },
        
    [tostring(GetHashKey('weapon_stungun'))] = {
    },
        
    [tostring(GetHashKey('weapon_pistol50'))] = {
        ['mag'] = GetHashKey('COMPONENT_PISTOL50_CLIP_02'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_PI_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP_02'),
    },
        
    [tostring(GetHashKey('weapon_snspistol'))] = {
        ['mag'] = GetHashKey('COMPONENT_SNSPISTOL_CLIP_02'),
    },
        
    [tostring(GetHashKey('weapon_snspistol_mk2'))] = {
        ['mag'] = GetHashKey('COMPONENT_REVOLVER_MK2_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_PI_RAIL_02'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_PI_FLSH'),
    },
        
    [tostring(GetHashKey('weapon_heavypistol'))] = {
        ['mag'] = GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_02'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_PI_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_PI_SUPP'),
    },
        
    [tostring(GetHashKey('weapon_vintagepistol'))] = {
        ['mag'] = GetHashKey('COMPONENT_VINTAGEPISTOL_CLIP_02'),
    },
        
    [tostring(GetHashKey('weapon_flaregun'))] = {
    },
        
    [tostring(GetHashKey('weapon_marksmanpistol'))] = {
    },
        
    [tostring(GetHashKey('weapon_revolver'))] = {
        ['mag'] = GetHashKey('COMPONENT_REVOLVER_CLIP_02'),
    },
        
    [tostring(GetHashKey('weapon_revolver_mk2'))] = {
        ['mag'] = GetHashKey('COMPONENT_REVOLVER_MK2_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_PI_FLSH'),
    },
        
    [tostring(GetHashKey('weapon_doubleaction'))] = {
    },
        
    [tostring(GetHashKey('weapon_ceramicpistol'))] = {
    },
        
    [tostring(GetHashKey('weapon_microsmg'))] = {
        ['mag'] = GetHashKey('COMPONENT_MICROSMG_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MACRO'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_PI_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP_02'),
    },
        
    [tostring(GetHashKey('weapon_smg'))] = {
        ['mag'] = GetHashKey('COMPONENT_SMG_CLIP_02'),
        ['drummag'] = GetHashKey('COMPONENT_SMG_CLIP_03'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_PI_SUPP'),
    },
        
    [tostring(GetHashKey('weapon_smg_mk2'))] = {
        ['mag'] = GetHashKey('COMPONENT_SMG_MK2_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SIGHTS_SMG'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_PI_SUPP'),
    },
        
    [tostring(GetHashKey('weapon_assaultsmg'))] = {
        ['mag'] = GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MACRO'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP_02'),
    },
        
    [tostring(GetHashKey('weapon_combatpdw'))] = {
        ['mag'] = GetHashKey('COMPONENT_COMBATPDW_CLIP_02'),
        ['drummag'] = GetHashKey('COMPONENT_COMBATPDW_CLIP_03'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_SMALL'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP'),
    },
        
    [tostring(GetHashKey('weapon_machinepistol'))] = {
        ['mag'] = GetHashKey('COMPONENT_MACHINEPISTOL_CLIP_02'),
        ['drummag'] = GetHashKey('COMPONENT_MACHINEPISTOL_CLIP_03'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_PI_SUPP'),
    },
        
    [tostring(GetHashKey('weapon_minismg'))] = {
        ['mag'] = GetHashKey('COMPONENT_MINISMG_CLIP_02'),
    },
        
    [tostring(GetHashKey('weapon_gusenberg'))] = {
        ['mag'] = GetHashKey('COMPONENT_GUSENBERG_CLIP_02'),
    },
        
    [tostring(GetHashKey('weapon_pumpshotgun'))] = {
    },
        
    [tostring(GetHashKey('weapon_pumpshotgun_mk2'))] = {
    },
        
    [tostring(GetHashKey('weapon_sawnoffshotgun'))] = {
    },
        
    [tostring(GetHashKey('weapon_assaultshotgun'))] = {
    },
        
    [tostring(GetHashKey('weapon_bullpupshotgun'))] = {
    },
        
    [tostring(GetHashKey('weapon_musket'))] = {
    },
        
    [tostring(GetHashKey('weapon_heavyshotgun'))] = {
    },
        
    [tostring(GetHashKey('weapon_dbshotgun'))] = {
    },
        
    [tostring(GetHashKey('weapon_autoshotgun'))] = {
    },
        
    [tostring(GetHashKey('weapon_assaultrifle'))] = {
        ['mag'] = GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02'),
        ['drummag'] = GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_03	'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MACRO'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP_02'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP'),
    },
        
    [tostring(GetHashKey('weapon_assaultrifle_mk2'))] = {
        ['mag'] = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM_MK2'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP_02'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'),
    },
        
    [tostring(GetHashKey('weapon_carbinerifle'))] = {
        ['mag'] = GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02'),
        ['drummag'] = GetHashKey('COMPONENT_CARBINERIFLE_CLIP_03'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP'),
    },
        
    [tostring(GetHashKey('weapon_carbinerifle_mk2'))] = {
        ['mag'] = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM_MK2'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'),
    },
        
    [tostring(GetHashKey('weapon_advancedrifle'))] = {
        ['mag'] = GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_SMALL'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH	'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP'),
    },
        
    [tostring(GetHashKey('weapon_specialcarbine'))] = {
        ['mag'] = GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_02'),
        ['drummag'] = GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_03'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP_02'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP'),
    },
        
    [tostring(GetHashKey('weapon_specialcarbine_mk2'))] = {
        ['mag'] = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM_MK2'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP_02'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'),
    },
        
    [tostring(GetHashKey('weapon_bullpuprifle'))] = {
        ['mag'] = GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_SMALL'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP'),
    },
        
    [tostring(GetHashKey('weapon_bullpuprifle_mk2'))] = {
        ['mag'] = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_SMALL_MK2	'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'),
    },
        
    [tostring(GetHashKey('weapon_compactrifle'))] = {
        ['mag'] = GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_02'),
        ['drummag'] = GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_03'),
    },
        
    [tostring(GetHashKey('weapon_mg'))] = {
        ['mag'] = GetHashKey('COMPONENT_MG_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_SMALL_02'),
    },
        
    [tostring(GetHashKey('weapon_combatmg'))] = {
        ['mag'] = GetHashKey('COMPONENT_COMBATMG_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP'),
    },
        
    [tostring(GetHashKey('weapon_combatmg_mk2'))] = {
        ['mag'] = GetHashKey('COMPONENT_COMBATMG_MK2_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM_MK2'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'),
    },
        
    [tostring(GetHashKey('weapon_sniperrifle'))] = {
        ['mag'] = GetHashKey('COMPONENT_SNIPERRIFLE_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MAX'),
    },
        
    [tostring(GetHashKey('weapon_heavysniper'))] = {
        ['mag'] = GetHashKey('COMPONENT_HEAVYSNIPER_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MAX'),
    },
        
    [tostring(GetHashKey('weapon_heavysniper_mk2'))] = {
        ['mag'] = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_MAX'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_SR_SUPP_03'),
    },
        
    [tostring(GetHashKey('weapon_marksmanrifle'))] = {
        ['mag'] = GetHashKey('COMPONENT_MARKSMANRIFLE_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP'),
    },
        
    [tostring(GetHashKey('weapon_marksmanrifle_mk2'))] = {
        ['mag'] = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['suppressor'] = GetHashKey('COMPONENT_AT_AR_SUPP'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP_02'),
    },
        
    [tostring(GetHashKey('weapon_grenadelauncher'))] = {
        ['mag'] = GetHashKey('COMPONENT_GRENADELAUNCHER_CLIP_02'),
        ['scope'] = GetHashKey('COMPONENT_AT_SCOPE_SMALL'),
        ['flashlight'] = GetHashKey('COMPONENT_AT_AR_FLSH'),
        ['grip'] = GetHashKey('COMPONENT_AT_AR_AFGRIP'),
    },
        
    [tostring(GetHashKey('weapon_firework'))] = {
    },
        
    [tostring(GetHashKey('weapon_grenade'))] = {
    },
        
    [tostring(GetHashKey('weapon_bzgas'))] = {
    },
        
    [tostring(GetHashKey('weapon_smokegrenade'))] = {
    },
        
    [tostring(GetHashKey('weapon_molotov'))] = {
    },
        
    [tostring(GetHashKey('weapon_snowball'))] = {
    },
        
    [tostring(GetHashKey('weapon_pipebomb'))] = {
    },
        
    [tostring(GetHashKey('weapon_ball'))] = {
    },
        
    [tostring(GetHashKey('weapon_flare'))] = {
    },
        
    [tostring(GetHashKey('weapon_petrolcan'))] = {
    },
        
    [tostring(GetHashKey('gadget_parachute'))] = {
    },
        
    [tostring(GetHashKey('weapon_fireextinguisher'))] = {
    },
        
    [tostring(GetHashKey('weapon_hazardcan'))] = {
    },
        
    [tostring(GetHashKey('weapon_nightstick'))] = {
    },
        
    [tostring(GetHashKey('weapon_knife'))] = {
    },
        
    [tostring(GetHashKey('weapon_dagger'))] = {
    },
        
    [tostring(GetHashKey('weapon_bat'))] = {
    },
        
    [tostring(GetHashKey('weapon_bottle'))] = {
    },
        
    [tostring(GetHashKey('weapon_crowbar'))] = {
    },
        
    [tostring(GetHashKey('weapon_flashlight'))] = {
    },
        
    [tostring(GetHashKey('weapon_golfclub'))] = {
    },
        
    [tostring(GetHashKey('weapon_hammer'))] = {
    },
        
    [tostring(GetHashKey('weapon_hatchet'))] = {
    },
        
    [tostring(GetHashKey('weapon_knuckle'))] = {
    },
        
    [tostring(GetHashKey('weapon_machete'))] = {
    },
        
    [tostring(GetHashKey('weapon_switchblade'))] = {
    },
        
    [tostring(GetHashKey('weapon_wrench'))] = {
    },
        
    [tostring(GetHashKey('weapon_battleaxe'))] = {
    },
        
    [tostring(GetHashKey('weapon_poolcue'))] = {
    },
        
    [tostring(GetHashKey('weapon_stone_hatchet'))] = {
    },        
}

RegisterNetEvent('DP_Inventory:useAttach')
AddEventHandler('DP_Inventory:useAttach', function(attach)
    local playerPed = PlayerPedId()
    local hasAttach = false
    if currentWeapon ~= nil then
        local hash = GetHashKey(currentWeapon)
        for i = 1, #currentWepAttachs do
            if currentWepAttachs[i] == attach then
                hasAttach = true
            end
        end
        if weapons[tostring(hash)] ~= nil and weapons[tostring(hash)][attach] ~= nil and not hasAttach then
            ESX.TriggerServerCallback('DP_Inventory:removeItem', function(cb)
                if cb then
                    table.insert(currentWepAttachs, attach)
                    GiveWeaponComponentToPed(playerPed, hash, weapons[tostring(hash)][attach])
                end
            end, attach)
        elseif string.find(attach, 'skin') then
            local number = tonumber(string.match(attach, "%d+"))
            ESX.TriggerServerCallback('DP_Inventory:removeItem', function(cb)
                if cb then
                    for k,v in pairs(currentWepAttachs) do
                        if v == 'skin' or v == 'skin1' or v == 'skin2' or v == 'skin3' or v == 'skin4' or v == 'skin5' or v == 'skin6' or v == 'skin7' then
                            table.remove(currentWepAttachs, k)
                        end
                    end
                    table.insert(currentWepAttachs, attach)
                    SetPedWeaponTintIndex(playerPed, hash, number)
                end
            end, attach)
        else
			exports['t-notify']:SendTextAlert('info', _U("not_compatible"), 5500, false)
        end
    else
		exports['t-notify']:SendTextAlert('info', _U("no_weapon_selected"), 5500, false)
    end
end)

RegisterKey('keyboard',"BACKSLASH",
	function()
	end,
	function()
        if not IsEntityDead(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), true) and not removingAttach then
            if currentWeapon ~= nil then
                removingAttach = true
                local playerPed = PlayerPedId()
                local hash = GetHashKey(currentWeapon)
                for i = 1, #currentWepAttachs do
                    if currentWepAttachs[i] ~= nil then
                        if string.find(currentWepAttachs[i], 'skin') == nil then
                            TriggerEvent("mythic_progbar:client:progress", {
                                name = "washing_gsr",
                                duration = 1500,
                                label = _U('waiting_remove'),
                                useWhileDead = false,
                                canCancel = false,
                                controlDisables = {
                                    disableMovement = false,
                                    disableCarMovement = false,
                                    disableMouse = false,
                                    disableCombat = false,
                            },
                        }, function(status)
                                if not status then
                                    RemoveWeaponComponentFromPed(playerPed, hash, weapons[tostring(hash)][currentWepAttachs[i]])
                                    ESX.TriggerServerCallback('DP_Inventory:addPlayerItem', function(cb)end, currentWepAttachs[i], 1)
                                    table.remove(currentWepAttachs, i)
                                    removingAttach = false
                                end
                            end)
                        end
                    end
                end
            else
				exports['t-notify']:SendTextAlert('info', _U("no_gun_in_hand"), 5500, false)
            end
		end
	end
)

function RemoveWeapon(weapon)
    local checkh = Config.Throwables
    local playerPed = PlayerPedId()
    local hash = GetHashKey(weapon)
    currentWeapon = nil
    ESX.TriggerServerCallback('DP_Inventory:doesWeaponHas', function(hasWeaponId)
        if hasWeaponId then
            weaponKey = hasWeaponId
        else
            weaponKey = GenerateWeapon()
        end
        local wepInfo = { 
            count = GetAmmoInPedWeapon(playerPed, hash),
            attach = currentWepAttachs,
            weapon_id = weaponKey
        }
        TriggerServerEvent('DP_Inventory:updateAmmoCount', hash, wepInfo)
        canFire = false
        disable()
        if checkh[weapon] == hash then
            if GetSelectedPedWeapon(playerPed) == hash then
                ESX.TriggerServerCallback('DP_Inventory:addPlayerItem', function(cb)
                end, weapon, 1)
            end
        end
        if ESX.GetPlayerData().job ~= nil and ESX.GetPlayerData().job.name == 'police' then --and GetWeapontypeGroup(hash) == 416676503 then
            if not HasAnimDictLoaded("reaction@intimidation@cop@unarmed") then
                loadAnimDict( "reaction@intimidation@cop@unarmed" )
            end
            TaskPlayAnim(playerPed, "reaction@intimidation@cop@unarmed", "outro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
            Citizen.Wait(100)
        else
            if not HasAnimDictLoaded("reaction@intimidation@1h") then
                loadAnimDict( "reaction@intimidation@1h" )
            end
            TaskPlayAnimAdvanced(playerPed, "reaction@intimidation@1h", "outro", GetEntityCoords(playerPed, true), 0, 0, GetEntityHeading(playerPed), 8.0, 3.0, -1, 50, 0, 0, 0)
            Citizen.Wait(1600)
        end
        RemoveWeaponFromPed(playerPed, hash)
        ClearPedTasks(playerPed)
        canFire = true
        TriggerEvent('DP_Inventory:notification', weapon, _U("weapon_pulled"), 1, false)
    end, hash)
end

function GiveWeapon(weapon)
    local checkh = Config.Throwables
    local playerPed = PlayerPedId()
    local hash = GetHashKey(weapon)
    if not HasAnimDictLoaded("reaction@intimidation@1h") then
        loadAnimDict( "reaction@intimidation@1h" )
    end
    if weapon == 'WEAPON_PETROLCAN' then
        local coords = GetEntityCoords(playerPed)
        if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 2.0) then
            TriggerEvent('DP_Inventory:removeCurrentWeapon')
            TriggerEvent('joca_fuel:useJerryCan')
        else
            canFire = false
            disable()
            TaskPlayAnimAdvanced(playerPed, "reaction@intimidation@1h", "intro", GetEntityCoords(playerPed, true), 0, 0, GetEntityHeading(playerPed), 8.0, 3.0, -1, 50, 0, 0, 0)
            Citizen.Wait(1600)
            GiveWeaponToPed(playerPed, hash, 1, false, true)
            SetPedAmmo(playerPed, hash, 1000)
            ClearPedTasks(playerPed)
            canFire = true
        end
    else
      ESX.TriggerServerCallback('DP_Inventory:getAmmoCount', function(gunInfo)
        currentWepAttachs = gunInfo.attachments
        canFire = false
        disable()
        if ESX.GetPlayerData().job ~= nil and ESX.GetPlayerData().job.name == 'police' then --and GetWeapontypeGroup(hash) == 416676503 then
            if not HasAnimDictLoaded("rcmjosh4") then
                loadAnimDict( "rcmjosh4" )
            end
            TaskPlayAnim(playerPed, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
            Citizen.Wait(500)
        else
            TaskPlayAnimAdvanced(playerPed, "reaction@intimidation@1h", "intro", GetEntityCoords(playerPed, true), 0, 0, GetEntityHeading(playerPed), 8.0, 3.0, -1, 50, 0, 0, 0)          
            Citizen.Wait(1600)
        end
        GiveWeaponToPed(playerPed, hash, 1, false, true)
        for i = 1, #currentWepAttachs do
            if weapons[tostring(hash)] ~= nil then
                GiveWeaponComponentToPed(playerPed, hash, weapons[tostring( hash )][currentWepAttachs[i]])
            end
            if currentWepAttachs[i] == 'skin1' then SetPedWeaponTintIndex(playerPed, hash, 1)
            elseif currentWepAttachs[i] == 'skin2' then SetPedWeaponTintIndex(playerPed, hash, 2)
            elseif currentWepAttachs[i] == 'skin3' then SetPedWeaponTintIndex(playerPed, hash, 3)
            elseif currentWepAttachs[i] == 'skin4' then SetPedWeaponTintIndex(playerPed, hash, 4)
            elseif currentWepAttachs[i] == 'skin5' then SetPedWeaponTintIndex(playerPed, hash, 5)
            elseif currentWepAttachs[i] == 'skin6' then SetPedWeaponTintIndex(playerPed, hash, 6)
            elseif currentWepAttachs[i] == 'skin7' then SetPedWeaponTintIndex(playerPed, hash, 7)
            end
        end
        if checkh[weapon] == hash then
            ESX.TriggerServerCallback('DP_Inventory:takePlayerItem', function(cb)
                SetPedAmmo(playerPed, hash, 1)
            end, weapon, 1)
        elseif Config.FuelCan == hash and gunInfo.ammoCount == nil then
            SetPedAmmo(playerPed, hash, 1000)
        else
            SetPedAmmo(playerPed, hash, gunInfo.ammoCount or 0)
        end
        ClearPedTasks(playerPed)
        canFire = true
      end, hash)
    end
end

function disable()
	Citizen.CreateThread(function ()
		while not canFire do
			Citizen.Wait(10)
			DisableControlAction(0, 25, true)
			DisablePlayerFiring(player, true)
		end
	end)
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(10)
	end
end

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GenerateWeapon()
	local generatedWeapon
	local doBreak = false

	while true do
		Citizen.Wait(2)
		math.randomseed(GetGameTimer())
		generatedWeapon = GetRandomLetter(30) .. GetRandomNumber(30)

		ESX.TriggerServerCallback('DP_Inventory:isWeaponNumberTaken', function(isWeaponTaken)
			if not isWeaponTaken then
				doBreak = true
			end
		end, generatedWeapon)

		if doBreak then
			break
		end
	end

	return generatedWeapon
end

function GetRandomNumber(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end
