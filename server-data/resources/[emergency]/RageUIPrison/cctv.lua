local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

scanId = 0
cityRobbery = false
local myspawns = {}
PRISONCamLocations = {
	[1] =  { ['x'] = 720.21,['y'] = 136.75,['z'] = 86.15,['h'] = 79.30, ['info'] = ' Entrer ', ["recent"] = false },
	[2] =  { ['x'] = 681.29,['y'] = 105.2,['z'] = 86.06,['h'] = 212.49, ['info'] = ' Gym ', ["recent"] = false },	
	[3] =  { ['x'] = 666.98,['y'] = 145.56,['z'] = 81.95,['h'] = 164.48, ['info'] = ' Cantine ', ["recent"] = false },
	[4] =  { ['x'] = 664.94,['y'] = 93.7,['z'] = 81.3,['h'] = 308.48, ['info'] = ' Cellule', ["recent"] = false },		
}


ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	  PlayerData = ESX.GetPlayerData()
	end
  end)


inCam = false
patocheCam = 0
RegisterNetEvent("prison-patoche:camera")
AddEventHandler("prison-patoche:camera", function(camNumber)
	camNumber = tonumber(camNumber)
	if inCam then
		inCam = false
		PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
		-- TriggerEvent('animation:tablet',false)
		Wait(250)
		ClearPedTasks(GetPlayerPed(-1))
	else
		if camNumber > 0 and camNumber < #PRISONCamLocations+1 then
			PlaySoundFrontend(-1, "HACKING_SUCCESS", false)
			TriggerEvent("prison-patoche:startcamera",camNumber)
		else
			exports['mythic_notify']:SendAlert('error', "This camera appears to be faulty")
		end
	end
end)

RegisterNetEvent("prison-patoche:startcamera")
AddEventHandler("prison-patoche:startcamera", function(camNumber)

	-- TriggerEvent('animation:tablet',true)
	local camNumber = tonumber(camNumber)
	local x = PRISONCamLocations[camNumber]["x"]
	local y = PRISONCamLocations[camNumber]["y"]
	local z = PRISONCamLocations[camNumber]["z"]
	local h = PRISONCamLocations[camNumber]["h"]

	print("starting cam")
	inCam = true

	SetTimecycleModifier("heliGunCam")
	SetTimecycleModifierStrength(1.0)


	local lPed = GetPlayerPed(-1)
	patocheCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
	SetCamCoord(patocheCam,x,y,z+1.2)						
	SetCamRot(patocheCam, -15.0,0.0,h)
	SetCamFov(patocheCam, 110.0)
	RenderScriptCams(true, false, 0, 1, 0)
	SetFocusArea(x, y, z, 0.0, 0.0, 0.0)

	while inCam do
		SetCamCoord(patocheCam,x,y,z+1.2)						
		-- SetCamRot(patocheCam, -15.0,0.0,h)
		Citizen.Wait(1)
	end
	ClearFocus()
	ClearTimecycleModifier()
	RenderScriptCams(false, false, 0, 1, 0)
	DestroyCam(patocheCam, false)
	SetNightvision(false)
	SetSeethrough(false)	

end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if inCam then

			local rota = GetCamRot(patocheCam, 2)

			if IsControlPressed(1, Keys['Z']) then
				SetCamRot(patocheCam, rota.x, 0.0, rota.z + 0.7, 2)
			end

			if IsControlPressed(1, Keys['Q']) then
				SetCamRot(patocheCam, rota.x, 0.0, rota.z - 0.7, 2)
			end

			if IsControlPressed(1, Keys['D']) then
				SetCamRot(patocheCam, rota.x + 0.7, 0.0, rota.z, 2)
			end

			if IsControlPressed(1, Keys['3']) then
				FreezeEntityPosition(PlayerPedId(), true)
				TriggerEvent('prison-patoche:camera', 1)
				DoScreenFadeOut(150)
	            Wait(300)
                DoScreenFadeIn(3000) 
				TriggerEvent('prison-patoche:camera', 1)
			end		

			if IsControlPressed(1, Keys['4']) then
				FreezeEntityPosition(PlayerPedId(), true)
				TriggerEvent('prison-patoche:camera', 2)
				DoScreenFadeOut(150)
	            Wait(300)
                DoScreenFadeIn(3000) 
				TriggerEvent('prison-patoche:camera', 2)
			end		

			if IsControlPressed(1, Keys['5']) then
				FreezeEntityPosition(PlayerPedId(), true)
				TriggerEvent('prison-patoche:camera', 3)
				DoScreenFadeOut(150)
	            Wait(300)
                DoScreenFadeIn(3000) 
				TriggerEvent('prison-patoche:camera', 3)
			end		

			if IsControlPressed(1, Keys['6']) then
				FreezeEntityPosition(PlayerPedId(), true)
				TriggerEvent('prison-patoche:camera', 4)
				DoScreenFadeOut(150)
	            Wait(300)
                DoScreenFadeIn(3000) 
				TriggerEvent('prison-patoche:camera', 4)
			end		

			if IsControlPressed(1, Keys['SPACE']) then				
				TriggerEvent('prison-patoche:camera', 4)
				Citizen.Wait(250)
				FreezeEntityPosition(PlayerPedId(), false)			
			end											

			if IsControlPressed(1, Keys['S']) then
				SetCamRot(patocheCam, rota.x - 0.7, 0.0, rota.z, 2)
			end
		end
	end
end)