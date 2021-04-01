ESX = nil

local isNearExersices = false
local isAtExersice = false
local isTraining = false

local Language = Config.Lang

PedsCoiffeur = { 
{ x = 651.9,   y = 96.84, z = 83.08, heading = 326.87 }
}
PedsTatto = {  
{ x = 677.27,   y = 90.47, z = 79.72, heading = 36.87 }
}
Peds = {
    cantine = {hash = "s_m_m_linecook", coords = vector4(658.028, 126.8552, 79.75455, -20)},
    cantine1 = {hash = "s_m_m_linecook", coords = vector4(660.8313, 125.7546, 79.75455, -20)},
    arme = {hash = "s_m_y_prismuscl_01", coords = vector4(704.3461, 92.26684, 79.75455, 100)},
}
Positions = {
	sortir = { x = 734.23, y =148.34, z = 80.75},
    positionrecyclerie = { x =677.46 , y =180.67, z =80.48 },
    tatto = { x = 677.27, y =90.47, z =79.72 },	
    coiffeur = { x = 651.9, y =96.84, z = 83.08 },	
    cam = { x = 662.07, y =90.01, z =80.72 },	
    positionPrison = { x =728.86 , y =150.80, z =79.74 }
}


local quitMenu = RageUI.CreateMenu(Config.Text[Language].RageUiMenuTitle,Config.Text[Language].RageUiMenuText .. GetPlayerName(PlayerId()) .. '')
local subMenu =  RageUI.CreateSubMenu(quitMenu, Config.Text[Language].RageUiMenuTitle, Config.Text[Language].RageUiMenuText .. GetPlayerName(PlayerId()) .. '')



local ctMenu = RageUI.CreateMenu(Config.Text[Language].RageUiMenuTitle2, Config.Text[Language].RageUiMenuText2 .. GetPlayerName(PlayerId()) .. '')
local wpMenu = RageUI.CreateMenu(Config.Text[Language].RageUiMenuTitle3, Config.Text[Language].RageUiMenuText3)


ActiverMarkerPrisonTenu = true -- false si vous ne voulez pas les Markers aux sols
local menu = RageUI.CreateMenu(Config.Text[Language].RageUiMenuTitle4, Config.Text[Language].RageUiMenuText4 .. GetPlayerName(PlayerId()) .. '')	 
ActiverMarkerCivil = true -- false si vous ne voulez pas les Markers aux sols
local menu1 = RageUI.CreateMenu(Config.Text[Language].RageUiMenuTitle5, Config.Text[Language].RageUiMenuText5 .. GetPlayerName(PlayerId()) .. '')	 
local tattomenu = RageUI.CreateMenu(Config.Text[Language].TattoBuy, Config.Text[Language].RageUiMenuText5 .. GetPlayerName(PlayerId()) .. '')
local camenu = RageUI.CreateMenu(Config.Text[Language].Camera, Config.Text[Language].RageUiMenuText5 .. GetPlayerName(PlayerId()) .. '')
local coiffeurmenu = RageUI.CreateMenu(Config.Text[Language].cheveux, Config.Text[Language].RageUiMenuText5 .. GetPlayerName(PlayerId()) .. '')
local menu3= RageUI.CreateMenu(Config.Text[Language].RageUiMenuTitle6, Config.Text[Language].RageUiMenuText6 .. GetPlayerName(PlayerId()) .. '')
ActiverMarker = true -- false si vous ne voulez pas les Markers aux sols

local recolerbnj = false
local maitem = false
local tekst = 0


Citizen.CreateThread(function()
	local sleep = 1
	local hash = GetHashKey("s_m_y_cop_01")
	while not HasModelLoaded(hash) do
		RequestModel(hash)
		Wait(20)
	end 
	ped = CreatePed("0x5E3DA4A4", hash,735.53,147.73,79.71,56.75, false, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)	
	SetEntityHeading(ped, 56.75)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
    for _,v in pairs (Peds) do
        while not HasModelLoaded(v.hash) do
            RequestModel(v.hash)
            Wait(20)
        end
        ped1 = CreatePed("PED_TYPE_CIVFEMALE", v.hash, v.coords, false, true)
        SetBlockingOfNonTemporaryEvents(ped1, true)
        SetEntityInvincible(ped1, true)
        FreezeEntityPosition(ped1, true)
    end
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
    while (true) do
        if Vdist2(GetEntityCoords(PlayerPedId(), false), Peds.cantine.coords) < 7 or Vdist2(GetEntityCoords(PlayerPedId(), false), Peds.cantine1.coords) < 7 then
            ESX.ShowHelpNotification(Config.Text[Language].NotifText2)
            if IsControlJustPressed(1, 51) then
                RageUI.Visible(ctMenu, not RageUI.Visible(ctMenu))
            end
        end
        if Vdist2(GetEntityCoords(PlayerPedId(), false), Peds.arme.coords) < 3 then
            ESX.ShowHelpNotification(Config.Text[Language].NotifText3)
            if IsControlJustPressed(1, 51) then
                RageUI.Visible(wpMenu, not RageUI.Visible(wpMenu))
            end
        end
        if Vdist2(GetEntityCoords(PlayerPedId(), false), Positions.sortir.x, Positions.sortir.y, Positions.sortir.z) < 3 then
            DrawMarker(-1, Positions.sortir.x, Positions.sortir.y, Positions.sortir.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.75, 1.75, 1.75, 0, 204, 0, 100, false, true, 2, false, false, false, false)
            ESX.ShowHelpNotification(Config.Text[Language].NotifText1)
            if IsControlJustPressed(1, 51) then
                RageUI.Visible(quitMenu, not RageUI.Visible(quitMenu))
            end 
        end             
        if Vdist2(GetEntityCoords(PlayerPedId(), false), Positions.positionPrison.x, Positions.positionPrison.y, Positions.positionPrison.z) < 3 then
            DrawMarker(27, Positions.positionPrison.x, Positions.positionPrison.y, Positions.positionPrison.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.75, 1.75, 1.75, 0, 204, 0, 100, false, true, 2, false, false, false, false)
            ESX.ShowHelpNotification(Config.Text[Language].NotifText4)
            if IsControlJustPressed(1, 51) then
                RageUI.Visible(menu, not RageUI.Visible(menu))
            end
        end
		
		if Vdist2(GetEntityCoords(PlayerPedId(), false), Positions.positionrecyclerie.x, Positions.positionrecyclerie.y, Positions.positionrecyclerie.z) < 3 then
            DrawMarker(27, Positions.positionrecyclerie.x, Positions.positionrecyclerie.y, Positions.positionrecyclerie.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.75, 1.75, 1.75, 0, 204, 0, 100, false, true, 2, false, false, false, false)
            ESX.ShowHelpNotification(Config.Text[Language].NotifText6)
            if IsControlJustPressed(1, 51) then
                RageUI.Visible(menu3, not RageUI.Visible(menu3))
            end
		end
		
		if Vdist2(GetEntityCoords(PlayerPedId(), false), Positions.tatto.x, Positions.tatto.y, Positions.tatto.z) < 3.0 then
            DrawMarker(-1, Positions.tatto.x, Positions.tatto.y, Positions.tatto.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.75, 1.75, 1.75, 0, 204, 0, 100, false, true, 2, false, false, false, false)
            ESX.ShowHelpNotification(Config.Text[Language].TattoSpeak)
            if IsControlJustPressed(1, 51) then
                RageUI.Visible(tattomenu, not RageUI.Visible(tattomenu))
            end
		end	

		if Vdist2(GetEntityCoords(PlayerPedId(), false), Positions.coiffeur.x, Positions.coiffeur.y, Positions.coiffeur.z) < 1.5 then
            DrawMarker(-1, Positions.coiffeur.x, Positions.coiffeur.y, Positions.coiffeur.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.75, 1.75, 1.75, 0, 204, 0, 100, false, true, 2, false, false, false, false)
            ESX.ShowHelpNotification(Config.Text[Language].TattoSpeak)
            if IsControlJustPressed(1, 51) then
                RageUI.Visible(coiffeurmenu, not RageUI.Visible(coiffeurmenu))
            end
		end	


		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, 693.10,173.76,80.74, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 693.17, y = 173.77, z =80.74 }, Config.Text[Language].DrawText1, 0.6)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
					collecter()
				end
			end					
		end
		
		if GetDistanceBetweenCoords(coords, 704.81,169.24,80.72, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 704.81, y = 169.24, z = 80.72}, Config.Text[Language].DrawText2, 0.6)
			if recolerbnj == false and maitem == false then
				collecter()
			end					
		end

		if GetDistanceBetweenCoords(coords, 660.77,138.02,79.73, true) < 1.8 then
			ESX.Game.Utils.DrawText3D({ x = 660.77, y = 138.02, z =80.73 }, Config.Text[Language].DrawTextCantine, 0.6)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
				manger()
                TriggerServerEvent('bnj:eat')
				end
			end					
		end
		if GetDistanceBetweenCoords(coords, 661.66,140.3,79.73, true) < 1.6 then
			ESX.Game.Utils.DrawText3D({ x = 661.66, y = 140.3, z =80.73 }, Config.Text[Language].DrawTextCantine, 0.6)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
				manger2()
                TriggerServerEvent('bnj:eat')
				end
			end					
		end
		if GetDistanceBetweenCoords(coords, 662.4,142.85,79.73, true) < 1.8 then
			ESX.Game.Utils.DrawText3D({ x = 662.4, y = 142.85, z =80.73 }, Config.Text[Language].DrawTextCantine, 0.6)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
				manger3()
                TriggerServerEvent('bnj:eat')
				end
			end					
		end 
		if GetDistanceBetweenCoords(coords, 663.56,145.55,79.73, true) < 1.8 then
			ESX.Game.Utils.DrawText3D({ x = 663.56, y = 145.55, z =80.73 }, Config.Text[Language].DrawTextCantine, 0.6)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
				manger4()
                TriggerServerEvent('bnj:eat')
				end
			end					
		end	
		if GetDistanceBetweenCoords(coords, 666.16,136.29,79.73, true) < 1.8 then
			ESX.Game.Utils.DrawText3D({ x = 666.16, y = 136.29, z =80.73 }, Config.Text[Language].DrawTextCantine, 0.6)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
				manger5()
                TriggerServerEvent('bnj:eat')
				end
			end					
		end	
		if GetDistanceBetweenCoords(coords, 667.93,140.99,79.73, true) < 1.8 then
			ESX.Game.Utils.DrawText3D({ x = 667.93, y = 140.99, z =80.73 }, Config.Text[Language].DrawTextCantine, 0.6)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
				manger7()
                TriggerServerEvent('bnj:eat')
				end
			end					
		end			

		if GetDistanceBetweenCoords(coords, 667.09,138.53,79.73, true) < 1.8 then
			ESX.Game.Utils.DrawText3D({ x = 667.09, y = 138.53, z =80.73 }, Config.Text[Language].DrawTextCantine, 0.6)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
				manger6()
                TriggerServerEvent('bnj:eat')
				end
			end					
		end	


		if GetDistanceBetweenCoords(coords, 668.92,143.63,79.73, true) < 1.8 then
			ESX.Game.Utils.DrawText3D({ x = 668.92, y = 143.63, z =80.73 }, Config.Text[Language].DrawTextCantine, 0.6)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
				manger8()
                TriggerServerEvent('bnj:eat')
				end
			end					
		end	

		if GetDistanceBetweenCoords(coords, 664.0,150.95,80.75, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 664.0, y = 150.95, z =80.75 }, Config.Text[Language].pipi, 0.7)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
                TriggerEvent('bnj:pipi')
				end
			end					
		end			

		if GetDistanceBetweenCoords(coords, 668.2,89.93,80.72, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 668.2, y = 89.93, z =80.72 }, Config.Text[Language].pipi, 0.4)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
                TriggerEvent('bnj:pipi')
				end
			end					
		end		

		if GetDistanceBetweenCoords(coords, 668.2,89.93,80.72, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 668.2, y = 89.93, z =80.52}, Config.Text[Language].caca, 0.4)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				TriggerEvent('bnj:caca')				
				end
			end					
		end		

		if GetDistanceBetweenCoords(coords, 672.17,90.59,80.72, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 672.17, y = 90.59, z =80.72 }, Config.Text[Language].pipi, 0.4)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
                TriggerEvent('bnj:pipi')
				end
			end					
		end		

		if GetDistanceBetweenCoords(coords, 672.17,90.59,80.72, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 672.17, y =90.59, z =80.52}, Config.Text[Language].caca, 0.4)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				TriggerEvent('bnj:caca')				
				end
			end					
		end									
		
		if GetDistanceBetweenCoords(coords, 664.77,89.4,80.72, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 664.77 , y =89.4, z =80.72 }, Config.Text[Language].pipi, 0.4)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
                TriggerEvent('bnj:pipi')
				end
			end					
		end		

		if GetDistanceBetweenCoords(coords, 664.77,89.4,80.72, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 664.77 , y =89.4, z =80.52}, Config.Text[Language].caca, 0.4)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				TriggerEvent('bnj:caca')				
				end
			end					
		end	

		if GetDistanceBetweenCoords(coords, 675.87,90.42,83.94, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 675.87 , y =90.42, z =83.94 }, Config.Text[Language].pipi, 0.4)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
                TriggerEvent('bnj:pipi')
				end
			end					
		end		

		if GetDistanceBetweenCoords(coords, 675.87,90.42,83.94, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 675.87 , y =90.42, z =83.64}, Config.Text[Language].caca, 0.4)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				TriggerEvent('bnj:caca')				
				end
			end					
		end	

		if GetDistanceBetweenCoords(coords, 664.62,89.9,83.94, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 664.62 , y =89.9, z =83.94 }, Config.Text[Language].pipi, 0.4)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
                TriggerEvent('bnj:pipi')
				end
			end					
		end		

		if GetDistanceBetweenCoords(coords, 664.62,89.9,83.94, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 664.62 , y =89.9, z =83.64 }, Config.Text[Language].caca, 0.4)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				TriggerEvent('bnj:caca')				
				end
			end					
		end		

		if GetDistanceBetweenCoords(coords, 672.17,90.5,83.94, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 672.17 , y =90.5, z =83.94 }, Config.Text[Language].pipi, 0.4)
			if IsControlJustPressed(1, 38)  then
				if recolerbnj == false and maitem == false then
                TriggerEvent('bnj:pipi')
				end
			end					
		end		

		if GetDistanceBetweenCoords(coords, 672.17,90.5,83.94, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 672.17 , y =90.5, z =83.64}, Config.Text[Language].caca, 0.4)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				TriggerEvent('bnj:caca')				
				end
			end					
		end				
			

		if GetDistanceBetweenCoords(coords, 679.57,119.95,79.75, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 679.57, y = 119.95, z = 80.75}, Config.Text[Language].sassoir, 0.3)
			if IsControlJustPressed(1, 38)  then
			if recolerbnj == false and maitem == false then
				sitchair()				
				end
			end					
		end	

		if GetDistanceBetweenCoords(coords, 679.57,119.95,79.75, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 679.57, y = 119.95, z = 80.75}, Config.Text[Language].livre, 0.3)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				book()				
				end
			end					
		end	

		if GetDistanceBetweenCoords(coords, 682.39,128.27,80.75, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 682.39, y = 128.27, z = 80.75}, Config.Text[Language].sassoir, 0.3)
			if IsControlJustPressed(1, 38)  then
			if recolerbnj == false and maitem == false then
				sitchair()				
				end
			end					
		end	

		if GetDistanceBetweenCoords(coords, 682.39,128.27,80.75, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 682.39, y = 128.27, z = 80.75}, Config.Text[Language].livre, 0.3)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				book()				
				end
			end					
		end	

		if GetDistanceBetweenCoords(coords, 684.54,135.69,80.75, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 684.54, y = 135.69, z = 80.75}, Config.Text[Language].sassoir, 0.3)
			if IsControlJustPressed(1, 38)  then
			if recolerbnj == false and maitem == false then
				sitchair()				
				end
			end					
		end		

		if GetDistanceBetweenCoords(coords, 684.54,135.69,80.75, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 684.54, y = 135.69, z = 80.75}, Config.Text[Language].livre, 0.3)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				book()				
				end
			end					
		end		
				
		if GetDistanceBetweenCoords(coords, 690.26,134.04,80.75, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 690.26, y = 134.04, z = 80.75}, Config.Text[Language].sassoir, 0.3)
			if IsControlJustPressed(1, 38)  then
			if recolerbnj == false and maitem == false then
				sitchair()				
				end
			end					
		end	

		if GetDistanceBetweenCoords(coords, 690.26,134.04,80.75, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 690.26, y = 134.04, z = 80.75}, Config.Text[Language].livre, 0.3)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				book()				
				end
			end					
		end		

		if GetDistanceBetweenCoords(coords, 685.54,118.26,80.75, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 685.54, y = 118.26, z = 80.75}, Config.Text[Language].sassoir, 0.3)
			if IsControlJustPressed(1, 38)  then
			if recolerbnj == false and maitem == false then
				sitchair()				
				end
			end					
		end	

		if GetDistanceBetweenCoords(coords, 685.54,118.26,80.75, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 685.54, y = 118.26, z = 80.75}, Config.Text[Language].livre, 0.3)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				book()				
				end
			end					
		end		

		if GetDistanceBetweenCoords(coords, 709.0,124.57,81.14, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 709.0, y = 124.57, z = 81.14}, Config.Text[Language].sassoir, 0.3)
			if IsControlJustPressed(1, 38)  then
			if recolerbnj == false and maitem == false then
				sitchair()				
				end
			end					
		end	

		if GetDistanceBetweenCoords(coords, 709.0,124.57,81.14, true) < 2.0 then
			ESX.Game.Utils.DrawText3D({ x = 709.0, y = 124.57, z = 81.14}, Config.Text[Language].livre, 0.3)
			if IsControlJustPressed(1, 303)  then
			if recolerbnj == false and maitem == false then
				book()				
				end
			end					
		end	

        if GetDistanceBetweenCoords(coords, 662.07,90.01,80.72, true) < 1.0 then
			ESX.Game.Utils.DrawText3D({ x = 662.07, y =90.01, z =80.72 }, Config.Text[Language].TextCam, 0.4)   
            if IsControlJustPressed(1, 51) then
                RageUI.Visible(camenu, not RageUI.Visible(camenu))
            end
		end	
				

        RageUI.IsVisible(quitMenu, function()

            RageUI.Button(Config.Text[Language].RageUIButtonText, nil, { RightLabel = "→→→" }, true, {
            },subMenu);
            end, function()
        end)
        RageUI.IsVisible(ctMenu, function()
            RageUI.Button(Config.Text[Language].RageUIButtonTitle1, nil, { RightLabel = "~y~20 "..Config.Text[Language].RageUIButtonMoney }, true, {
                onSelected = function()
                    TriggerServerEvent('bnj:GivePrsnPain')
                end,
            });
            end, function()
        end)
        RageUI.IsVisible(wpMenu, function()

            RageUI.Button(Config.Text[Language].RageUIButtonTitle3, nil, { RightLabel = "~b~30 "..Config.Text[Language].RageUIButtonMoney }, true, {
                onSelected = function()
                    TriggerServerEvent('bnj:GivePrsnCouteau', "weapon_dagger", 30)
                end,
            });
            RageUI.Button(Config.Text[Language].RageUIButtonTitle4, nil, { RightLabel = "~b~40 "..Config.Text[Language].RageUIButtonMoney }, true, {
                onSelected = function()
                    TriggerServerEvent('bnj:GivePrsnCouteau', "weapon_crowbar", 40)
                end,
            });
            end, function()
        end)
        RageUI.IsVisible(subMenu, function()
            local inventory = ESX.GetPlayerData().inventory
            local count = 0
            for i=1, #inventory, 1 do
                if inventory[i].name == 'ticket' then
                    count = inventory[i].count
                    
                end
            end
			
            RageUI.Separator(Config.Text[Language].RageUISeparator.." ~g~"..count)
            RageUI.Button(Config.Text[Language].RageUIButtonLeave, nil, {}, true, {
                onHovered = function()
                end,
                onSelected = function()
					TriggerServerEvent('bnj:hasItem')
                    RageUI.CloseAll()
                end,
            });
            end, function()
        end)
        RageUI.IsVisible(tattomenu, function()
            local inventory = ESX.GetPlayerData().inventory
            local count = 0
            for i=1, #inventory, 1 do
                if inventory[i].name == 'ticket' then
                    count = inventory[i].count
                    
                end
            end
            RageUI.Separator(Config.Text[Language].RageUISeparator.." ~g~"..count)
            RageUI.Separator("") 	
			RageUI.Button(Config.Text[Language].TattoBuy, nil,  { RightLabel = "~b~3 "..Config.Text[Language].RageUIButtonMoney },  true, {
				onSelected = function()
				    TriggerEvent('bnj:tattoX')                 
					RageUI.CloseAll()
				end,
			});	
			end, function()
		end)	
        RageUI.IsVisible(camenu, function()	
        	RageUI.Separator(Config.Text[Language].TextCam2)
        	RageUI.Separator("3-4-5-6")
        	RageUI.Separator(Config.Text[Language].TextCam3)
        	RageUI.Separator(Config.Text[Language].TextCam4)
        	RageUI.Separator(Config.Text[Language].TextCam5)
        	RageUI.Separator(Config.Text[Language].TextCam6)
        	RageUI.Separator("")
			RageUI.Button(Config.Text[Language].Camera, nil,  { RightLabel = "🎥"},  true, {
				onSelected = function()			    
				    FreezeEntityPosition(PlayerPedId(), true)
				    DoScreenFadeOut(150)
	                Wait(300)
                    DoScreenFadeIn(3000) 
				    TriggerEvent('prison-patoche:camera', 1) 
				    RageUI.CloseAll()
				end,
			});	
			end, function()
		end)      
        RageUI.IsVisible(coiffeurmenu, function()
            local inventory = ESX.GetPlayerData().inventory
            local count = 0
            for i=1, #inventory, 1 do
                if inventory[i].name == 'ticket' then
                    count = inventory[i].count
                    
                end
            end
            RageUI.Separator(Config.Text[Language].RageUISeparator.." ~g~"..count)
            RageUI.Separator("") 	
			RageUI.Button(Config.Text[Language].cheveux, nil,  { RightLabel = "~b~3 "..Config.Text[Language].RageUIButtonMoney },  true, {
				onSelected = function()
				    RageUI.CloseAll()
				    TriggerEvent('bnj:barbermenu') 
                    TriggerEvent('bnj:coiffeur')
                    sitchair()
				end,
			});			
			end, function()
		end)  
        RageUI.IsVisible(menu, function()
			RageUI.Button(Config.Text[Language].RageUIButton2, nil,  { RightBadge = RageUI.BadgeStyle.Clothes},  true, {
				onSelected = function()
					OnEsPartit()
					RageUI.CloseAll()
				end,
			});
			end, function()
		end)
		RageUI.IsVisible(menu3, function()
			RageUI.Button(Config.Text[Language].RageUIButtonSell, nil,  { RightBadge = RageUI.BadgeStyle.Car},  true, {
				onSelected = function()
					skup()
					RageUI.CloseAll()
				end,
			});
			end, function()
		end)
        Citizen.Wait(sleep)
    end

end)
RegisterCommand("coords", function() print(GetEntityCoords(PlayerPedId())) end)


RegisterNetEvent('bnj:eat55')
AddEventHandler('bnj:eat55', function()
anim()
end)

function anim()
FreezeEntityPosition(PlayerPedId(), true)
ExecuteCommand("e sitchair")
Citizen.Wait(1000)	
TriggerServerEvent('bnj:eat2')
Citizen.Wait(4000)
ExecuteCommand("e sandwich")
Citizen.Wait(2000)
ExecuteCommand("e egobar")
Citizen.Wait(2000)
ExecuteCommand("e cup")
Citizen.Wait(2000)
FreezeEntityPosition(PlayerPedId(), false)	
end

function sitchair()
ExecuteCommand('e sitchair')
end
function book()
ExecuteCommand('e book')
end
function manger()
TriggerEvent('bnj:toitTP3')	
end
function manger2()
TriggerEvent('bnj:toitTP4')	
end
function manger3()
TriggerEvent('bnj:toitTP5')	
end
function manger4()
TriggerEvent('bnj:toitTP6')	
end
function manger5()
TriggerEvent('bnj:toitTP7')	
end
function manger6()
TriggerEvent('bnj:toitTP8')	
end
function manger7()
TriggerEvent('bnj:toitTP9')	
end
function manger8()
TriggerEvent('bnj:toitTP10')	
end

RegisterNetEvent('bnj:coiffeur')
AddEventHandler('bnj:coiffeur', function(entity)
	local dir = vector3(652.68,98.03,83.38)
	local Camera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	ShakeCam(Camera,"HAND_SHAKE",0.3)
	SetCamActive(Camera, true)
	RenderScriptCams(true, true, 10, true, true)
	SetCamFov(Camera,65.0)
	SetCamCoord(Camera, 653.61,97.88,85.08)
	PointCamAtEntity(Camera,PlayerPedId())
	DoScreenFadeIn(3500)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	SetEntityCoords(PlayerPedId(),652.68,98.03,83.38)
	SetEntityHeading(PlayerPedId(), 303.0)
	local dir = vector3(652.68,98.03,83.38)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
end)

function collecter()
	TriggerServerEvent('bnj:collectionner')
	recolerbnj = true
end

function OnEsPartit()
	function StartMusicEvent(event)
		PrepareMusicEvent(event)
		return TriggerMusicEvent(event) == 1
	end
	StartMusicEvent("FM_INTRO_START")
	DoScreenFadeOut(1500)
	medkit = CreateObject(GetHashKey("prop_med_bag_01b"), 0, 0, 0, true, true, true)
	AttachEntityToEntity(medkit, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
	Wait(1300)
	RenderScriptCams(0, 1, 500, 1, 1)
	local Camera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
	ShakeCam(Camera,"HAND_SHAKE",0.3)
	SetCamActive(Camera, true)
	RenderScriptCams(true, true, 10, true, true)
	SetCamFov(Camera,50.0)
	SetCamCoord(Camera, 734.47,153.94,81.08)
	PointCamAtEntity(Camera,PlayerPedId())
	DoScreenFadeIn(3500)
	local dir = vector3(734.20,148.36,80.71)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	Wait(5500)
	ExecuteCommand('me '..Config.Text[Language].RageUICommandText)
	print("^9BrownyProd ^4| ^6BNJ Homme Efficace ^4| ^3Sarish ^4 | SP ")
	playAnim('mp_cop_armoury', 'pistol_on_counter_cop', Config.Animation.Time)
	Citizen.Wait(Config.Animation.Time)
	DeleteEntity(medkit)
	TaskPlayAnim(ped, "mp_cop_armoury", "rifle_on_counter_cop", 2.0, 2.0, -1, 0, 0, false, false, false)
	Citizen.Wait(3000)	
	medkitbnj = CreateObject(GetHashKey("p_t_shirt_pile_s"), 0, 0, 0, true, true, true)
	AttachEntityToEntity(medkitbnj, ped, GetPedBoneIndex(ped, 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
	playAnim('mp_common', 'givetake1_a', Config.Animation.Time)
	medkitbnjbnj = CreateObject(GetHashKey("p_t_shirt_pile_s"), 0, 0, 0, true, true, true)
	AttachEntityToEntity(medkitbnjbnj, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
	Wait(2500)
	DeleteEntity(medkitbnjbnj)
	ESX.ShowHelpNotification(Config.Text[Language].RageUIGuardianOutFit)
	playAnim('mp_clothing@female@shirt', 'try_shirt_positive_a', Config.Animation1.Time)
	Citizen.Wait(2500)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_vetement.male)
		else
			TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_vetement.female)
		end
	end)
	Wait(2500)
	DoScreenFadeOut(850)
	Wait(2500)
	RenderScriptCams(0, 1, 500, 1, 1)
	RenderScriptCams(true, true, 10, true, true)
	DoScreenFadeIn(3500)

	RenderScriptCams(false, true, 2000, true, true)
	DestroyCam(Camera)
	StartMusicEvent("FM_SUDDEN_DEATH_STOP_MUSIC")
end 



function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end


RegisterNetEvent('bnj:toitTP3')
AddEventHandler('bnj:toitTP3', function(entity)
	local dir = vector3(660.77, 138.02, 79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	SetEntityCoords(PlayerPedId(),660.77,138.02,79.73)
	local dir = vector3(660.77,138.02,79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
end)
RegisterNetEvent('bnj:toitTP4')
AddEventHandler('bnj:toitTP4', function(entity)
	local dir = vector3(661.66, 140.3, 79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	SetEntityCoords(PlayerPedId(),661.66,140.3,79.73)
	local dir = vector3(661.66,140.3,79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
end)
RegisterNetEvent('bnj:toitTP5')
AddEventHandler('bnj:toitTP5', function(entity)
	local dir = vector3(662.47, 142.85, 79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	SetEntityCoords(PlayerPedId(),662.47, 142.85, 79.73)
	local dir = vector3(662.47, 142.85, 79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
end)
RegisterNetEvent('bnj:toitTP6')
AddEventHandler('bnj:toitTP6', function(entity)
	local dir = vector3(663.56, 145.55, 79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	SetEntityCoords(PlayerPedId(),663.56,145.55,79.73)
	local dir = vector3(663.56,145.55,79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
end)
RegisterNetEvent('bnj:toitTP7')
AddEventHandler('bnj:toitTP7', function(entity)
	local dir = vector3(666.16, 136.29, 79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	SetEntityCoords(PlayerPedId(),666.16,136.29,79.73)
	local dir = vector3(666.16,136.29,79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
end)
RegisterNetEvent('bnj:toitTP8')
AddEventHandler('bnj:toitTP8', function(entity)
	local dir = vector3(667.09,138.53,79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	SetEntityCoords(PlayerPedId(),667.09,138.53,79.73)
	local dir = vector3(667.09,138.53,79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
end)
RegisterNetEvent('bnj:toitTP9')
AddEventHandler('bnj:toitTP9', function(entity)
	local dir = vector3(667.93,140.99,79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	SetEntityCoords(PlayerPedId(),667.93,140.99,79.73)
	local dir = vector3(667.93,140.99,79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
end)
RegisterNetEvent('bnj:toitTP10')
AddEventHandler('bnj:toitTP10', function(entity)
	local dir = vector3(668.92,143.63,79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	SetEntityCoords(PlayerPedId(),668.92,143.63,79.73)
	local dir = vector3(668.92,143.63,79.73)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
end)
RegisterNetEvent('bnj:sortiePrison')
AddEventHandler('bnj:sortiePrison', function(entity)
	function StartMusicEvent(event)
		PrepareMusicEvent(event)
		return TriggerMusicEvent(event) == 1
	end	
	StartMusicEvent("FM_INTRO_START")
	FreezeEntityPosition(PlayerPedId(), true)	
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
	playAnim('mp_clothing@female@shirt', 'try_shirt_positive_a', Config.Animation1.Time)
	Citizen.Wait(4000)
	TriggerEvent('skinchanger:loadSkin', skin)
	TriggerEvent('esx:restoreLoadout')
	FreezeEntityPosition(PlayerPedId(), false)	
	Citizen.Wait(4000)
	DoScreenFadeOut(3000)
	Wait(3500)
    DoScreenFadeIn(6000)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
    TriggerEvent('bnj:sortiePrison2')
	end)	
end)

RegisterNetEvent('bnj:sortiePrison2')
AddEventHandler('bnj:sortiePrison2', function(entity)

	local dir = vector3(734.13, 148.17, 80.72)
	SetEntityCoords(PlayerPedId(),727.85,147.86,80.75)
	local dir = vector3(721.64,138.95,80.75)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
	Citizen.Wait(7000)	
    TriggerEvent('bnj:sortiePrison3')
end)

RegisterNetEvent('bnj:sortiePrison3')
AddEventHandler('bnj:sortiePrison3', function(entity)
	function StartMusicEvent(event)
		PrepareMusicEvent(event)
		return TriggerMusicEvent(event) == 1
	end			
	local dir = vector3(736.43, 132.52, 80.72)
	DoScreenFadeOut(3000)
	Wait(3500)
    DoScreenFadeIn(6000)
	SetEntityCoords(PlayerPedId(),736.43,132.52,80.72)
	local dir = vector3(750.99,124.77,78.42)
	TaskGoToCoordAnyMeans(PlayerPedId(), dir, 1.0, 0, 0, 786603, 0xbf800000)
    DoScreenFadeIn(6000)	
	StartMusicEvent("FM_SUDDEN_DEATH_STOP_MUSIC")
end)




function skup()
	TriggerServerEvent('bnj:skup')
	Citizen.Wait(3500)
	Citizen.Wait(13000)
	FreezeEntityPosition(PlayerPedId(), false)
	recolerbnj = false
end



RegisterNetEvent('bnj:traitement')
AddEventHandler('bnj:traitement', function()
	playerPed = PlayerPedId()	
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(playerPed, true)
end)
RegisterNetEvent('bnj:collecte')
AddEventHandler('bnj:collecte', function()
	playerPed = PlayerPedId()
	FreezeEntityPosition(playerPed, false)
	ClearPedTasks(PlayerPedId())
	maitem = true
	Citizen.Wait(1000)
	recolerbnj = false
	TriggerEvent('bnj:prop')
end)

RegisterNetEvent('bnj:craft')
AddEventHandler('bnj:craft', function()
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
	Citizen.Wait(2000)
end)

RegisterNetEvent('bnj:prop')
AddEventHandler('bnj:prop', function()
	function loadAnimDict(dict)
		while (not HasAnimDictLoaded(dict)) do
			RequestAnimDict(dict)
			Citizen.Wait(5)
		end
	end
	local ad = "anim@heists@box_carry@"
	loadAnimDict( ad )
	TaskPlayAnim( PlayerPedId(), ad, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )

	local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
	local bnj = math.random(1,3)
	if bnj == 1 then
		bagModel = 'prop_car_door_04'
		porte = CreateObject(GetHashKey(bagModel), x, y, z+0.2,  true,  true, true)
		AttachEntityToEntity(porte, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.00, 0.355, -75.0, 470.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(10000)

	elseif bnj == 2 then
		bagModel = 'prop_car_door_04'
		porte = CreateObject(GetHashKey(bagModel), x, y, z+0.2,  true,  true, true)
		AttachEntityToEntity(porte, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.00, 0.355, -045.0, 480.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(10000)

	else	
		bagModel = 'prop_car_door_04'
		porte = CreateObject(GetHashKey(bagModel), x, y, z+0.2,  true,  true, true)
		AttachEntityToEntity(porte, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.00, 0.355, -75.0, 470.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(10000)
	end
end)

RegisterNetEvent('bnj:tattoXXX')
AddEventHandler('bnj:tattoXXX', function()
TriggerEvent('bnj:tattoX')
end)


RegisterNetEvent('bnj:propa')
AddEventHandler('bnj:propa', function()
	DetachEntity(porte, 1, 1)
	DeleteObject(porte)
	maitem = false
	ClearPedSecondaryTask(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
end)

local UI = { 
	x =  0.000 ,	
	y = -0.001 ,
}

RegisterNetEvent('bnj:craft2')
AddEventHandler('bnj:craft2', function()
	while true do
		Citizen.Wait(1)
		if recolerbnj == true then
		drawTxt(UI.x + 0.9605, UI.y + 0.962, 1.0,0.98,0.4, "~y~[~w~".. tekst .. "%~y~]", 255, 255, 255, 255)
		end
	end
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(2, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('bnj:notif')
AddEventHandler('bnj:notif', function()
	recolerbnj = false
end)
RegisterNetEvent('traitement')
AddEventHandler('traitement', function()
	for v = 1,101 do
		Citizen.Wait(37)
		tekst = tekst + 1
	end
	Citizen.Wait(1500)
	tekst = 0
end)

 ------------------------
----------Douche----------
 ------------------------
 local changepas = false 
 local douche = { 
     ["Douche1"] = { ["x"] = 649.96, ["y"] =90.00, ["z"] = 82.94, ["h"] = 331.51}, 
     ["Douche2"] = { ["x"] = 647.61, ["y"] =90.84, ["z"] =82.94, ["h"] = 334.94}, 
     ["Douche3"] = { ["x"] = 645.53, ["y"] =91.64, ["z"] =82.94, ["h"] = 339.72}, 
     ["Douche4"] = { ["x"] = 643.69, ["y"] =92.28, ["z"] =82.94, ["h"] = 341.35}, 
     ["Douche5"] = { ["x"] = 645.62, ["y"] =99.15, ["z"] =82.94, ["h"] = 175.30}, 
     ["Douche6"] = { ["x"] = 647.93, ["y"] =99.12, ["z"] =82.94, ["h"] = 177.57}, 
     ["Douche7"] = { ["x"] = 650.31, ["y"] =99.07, ["z"] =82.94, ["h"] = 177.78}
 
 
 } 
 
 RegisterNetEvent('bnj:sync')
 AddEventHandler('bnj:sync', function(ped, stop)
         local Player = ped
         local PlayerPed = PlayerPedId()
         local particleDictionary = "core"
         local particleName = "ent_amb_fly_swarm"
 
         RequestNamedPtfxAsset(particleDictionary)
 
         while not HasNamedPtfxAssetLoaded(particleDictionary) do
             Citizen.Wait(0)
         end
 
         SetPtfxAssetNextCall(particleDictionary)
         BNJ_BronwyProd = GetPedBoneIndex(PlayerPed, 11816)
         Wait(25)
         effect2 = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, BNJ_BronwyProd, 2.2, false, false, false)
         Wait(25)
         effect3 = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, BNJ_BronwyProd, 2.2, false, false, false)
         Wait(25)
         effect4 = StartParticleFxLoopedOnPedBone("exp_grd_bzgas_smoke", PlayerPed, 0.0, -0.6, -0.2, 0.0, 0.0, 20.0, BNJ_BronwyProd, 0.7, false, false, false)
         Wait(25)
         StopParticleFxLooped(effect2, 0)
         Wait(25)
         StopParticleFxLooped(effect3, 0)
         Wait(25)
         StopParticleFxLooped(effect4, 0)
 end)
 
 Citizen.CreateThread(function()
     while true do
       
     Citizen.Wait(5)
       
         local coords = GetEntityCoords(PlayerPedId())
         for k, v in pairs(douche) do
             if GetDistanceBetweenCoords(coords, v["x"], v["y"], v["z"], true) < 1.5 then
                     ESX.ShowHelpNotification(Config.Text[Language].RageUIShower)
                     if IsControlPressed(0, 38) then
                         changepas = false
                         local hashSkin = GetHashKey("mp_m_freemode_01") 	
                         SetEntityCoords(PlayerPedId(), v["x"], v["y"], v["z"])
                         SetEntityHeading(PlayerPedId(), v["h"])
                         FreezeEntityPosition(PlayerPedId(), true)
                         if GetEntityModel(PlayerPedId()) == hashSkin then 
                                 print("^9BrownyProd ^4| ^6BNJ Homme Efficace")
                             TriggerEvent('skinchanger:getSkin', function(skin)
                                 local clothesSkin = {
                                 ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                                 ['torso_1'] = 15, ['torso_2'] = 0,
                                 ['arms'] = 15,
                                 ['pants_1'] = 61, ['pants_2'] = 5,
                                 ['shoes_1'] = 34, ['shoes_2'] = 0,
                             }
                             TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
 
                         end)
                         else
                             print("^9BrownyProd ^4| ^6BNJ Homme Efficace")
                             TriggerEvent('skinchanger:getSkin', function(skin)
                                 local clothesSkin = {
                                 ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                                 ['torso_1'] = 15, ['torso_2'] = 0,
                                 ['arms'] = 15,
                                 ['pants_1'] = 15, ['pants_2'] = 0,
                                 ['shoes_1'] = 35, ['shoes_2'] = 0,
                             }
                             TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
 
                             end)
                         end
                         Citizen.Wait(500)
                         TriggerEvent('bnj:supersync',PlayerPedId(), 'bnj', v["x"], v["y"], v["z"])
                         Citizen.Wait(2500)
                         Citizen.Wait(1000)
                         TriggerEvent('bnj:supersync', PlayerPedId(), 'bnj1')
                         Citizen.Wait(6500)
                         FreezeEntityPosition(PlayerPedId(), false)
                     end
                 end
             end 
         end
     end)
 
 RegisterNetEvent('bnj:syncdouche')
 AddEventHandler('bnj:syncdouche', function(ped, x, y, z)
         local Player = ped
         local PlayerPed =PlayerPedId()
         local particleDictionary = "core"
         local particleName = "exp_sht_steam"
         local animDictionary = 'mp_safehouseshower@male@'
         local animDictionary2 = 'mp_safehouseshower@female@'
         local animName = 'male_shower_towel_dry_to_get_dressed'
         prop_name = prop_name or 'v_res_fa_sponge01'
         local playerPed = PlayerPedId()
         local x,y,z = table.unpack(GetEntityCoords(playerPed))
         local propsuper = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
         local boneIndex = GetPedBoneIndex(playerPed, 18905)
         AttachEntityToEntity(propsuper, playerPed, boneIndex, 0.12, 0.035, 0.009, -30.0, -240.0, -120.0, true, true, false, true, 1, true)
         RequestAnimDict(animDictionary)
 
         while not HasAnimDictLoaded(animDictionary) do
             Citizen.Wait(0)
         end
         
         local hashSkin = GetHashKey("mp_m_freemode_01") 
         RequestAnimDict(animDictionary2)
 
         while not HasAnimDictLoaded(animDictionary2) do
             Citizen.Wait(0)
         end		
         TaskPlayAnim(PlayerPed, animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
         
         RequestNamedPtfxAsset(particleDictionary)
 
         while not HasNamedPtfxAssetLoaded(particleDictionary) do
             Citizen.Wait(0)
         end
 
         SetPtfxAssetNextCall(particleDictionary)
         
         local coords = GetEntityCoords(playerPed)
         local effect = StartParticleFxLoopedAtCoord(particleName, x, y, z+1.3, 0.0, 180.0, 0.0, 1.0, false, false, false, false)
         Wait(25)
         Wait(10000)
         DeleteEntity(propsuper)
         while not DoesParticleFxLoopedExist(effect) do
         Wait(5)
         end
         StopParticleFxLooped(effect, 0)
         Wait(25)
         StopParticleFxLooped(effect, 0)
         ClearPedTasks(PlayerPed)
         ClearPedBloodDamage(PlayerPed)
         ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
             if skin.sex == 0 then
                 TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_vetement.male)
             else
                 TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prison_vetement.female)
             end
         Wait(25)
         StopParticleFxLooped(effect, 0)
         end)
        SetPedWetnessHeight(PlayerPed, 1.0)
      end)
 
 

      
--Douche 
AddEventHandler('bnj:supersync', function(player, sync, x, y, z)
	if sync == 'bnj1' then
		TriggerEvent('bnj:sync', -1, player)
	elseif sync == 'bnj' then
		TriggerEvent('bnj:syncdouche', -1, player, x, y, z)

	end
end)



Citizen.CreateThread(function()

	if Config.EnableBlip then
		local blip = AddBlipForCoord( Config.MapBlip.Pos.x,  Config.MapBlip.Pos.y,  Config.MapBlip.Pos.z)
		SetBlipSprite (blip,  Config.MapBlip.Sprite)
		SetBlipDisplay(blip,  Config.MapBlip.Display)
		SetBlipScale  (blip,  Config.MapBlip.Scale)
		SetBlipColour (blip,  Config.MapBlip.Colour)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(Config.MapBlip.Name)
		EndTextCommandSetBlipName(blip)
	end

	while true do
		Citizen.Wait(350)
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(GetPlayerPed(-1), false)

		isNearExersices = false
		isAtExersice = false

		for k, v in pairs(Config.Exersices) do
			local distance = Vdist(playerCoords, v.x, v.y, v.z)
			if distance < 20.0 then
				isNearExersices = true
			end
			if distance < 1.0 then
				isAtExersice = true
				currentExersice = v
			end
		end
		
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isNearExersices then
			for k, v in pairs(Config.Exersices) do
				DrawMarker(21, v.x, v.y, v.z, 0, 0, 0, 0, 0, 0, 0.301, 0.301, 0.3001, 225, 0, 0, 55, 0, 0, 0, 0)
			end
		end

		if isAtExersice then
			if not isTraining then
				showInfobar(Config.Text[Language].ExersiceString)
			else
				showInfobar(Config.Text[Language].AbortString)
			end
			
			if IsControlJustReleased(0, Config.ExersiceKey) then
				
				if isTraining then
					isTraining = false	
					ClearPedTasksImmediately(PlayerPedId())
					ShowNotification(Config.Text[Language].FinishString)
				else
					if currentExersice.type == 'des sit ups' then
						SetEntityCoords(PlayerPedId(), currentExersice.fixedChinPos.x, currentExersice.fixedChinPos.y, currentExersice.fixedChinPos.z - 1)
						SetEntityHeading(PlayerPedId(), currentExersice.fixedChinPos.rot)
					end
					isTraining = true
					TaskStartScenarioInPlace(PlayerPedId(), currentExersice.scenario, 0, true)
					--workOut()
					if currentExersice.type == 'traction' then
						SetEntityCoords(PlayerPedId(), currentExersice.fixedChinPos.x, currentExersice.fixedChinPos.y, currentExersice.fixedChinPos.z - 1)
						SetEntityHeading(PlayerPedId(), currentExersice.fixedChinPos.rot)
					end
					isTraining = true
					TaskStartScenarioInPlace(PlayerPedId(), currentExersice.scenario, 0, true)
					--workOut()					
				end
				
			end
		end
	end
end)

--[[function workOut()
	Citizen.Wait(Config.ExersiceDuration * 1000)
	ClearPedTasksImmediately(PlayerPedId())
	ShowNotification(Config.FinishString)
	isTraining = false
end--]]

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end

function showInfobar(msg)

	CurrentActionMsg  = msg
	SetTextComponentFormat('STRING')
	AddTextComponentString(CurrentActionMsg)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)

end


Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_y_prisoner_01"))
	
    while not HasModelLoaded(GetHashKey("s_m_y_prisoner_01")) do
        Wait(1)
    end
	
	for _, item in pairs(PedsCoiffeur) do
		local npc = CreatePed(4, 0xB1BB9B59, item.x, item.y, item.z, item.heading, false, true)
		
		FreezeEntityPosition(npc, true)	
		SetEntityHeading(npc, item.heading)
		SetEntityInvincible(npc, true)
		SetBlockingOfNonTemporaryEvents(npc, true)
		RequestAnimDict("random@shop_gunstore")
		while not HasAnimDictLoaded("random@shop_gunstore") do
			Citizen.Wait(1000)
		end
			
	    Citizen.Wait(200)	
		TaskPlayAnim(npc,"random@shop_gunstore","_idle",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
	end
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_y_prisoner_01"))
	
    while not HasModelLoaded(GetHashKey("s_m_y_prisoner_01")) do
        Wait(1)
    end
	
	for _, item in pairs(PedsTatto) do
		local npc = CreatePed(4, 0xB1BB9B59, item.x, item.y, item.z, item.heading, false, true)
		
		FreezeEntityPosition(npc, true)	
		SetEntityHeading(npc, item.heading)
		SetEntityInvincible(npc, true)
		SetBlockingOfNonTemporaryEvents(npc, true)
		RequestAnimDict("timetable@ron@ig_3_couch")
		while not HasAnimDictLoaded("timetable@ron@ig_3_couch") do
			Citizen.Wait(1000)
		end
			
	    Citizen.Wait(200)	
		TaskPlayAnim(npc,"timetable@ron@ig_3_couch","base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
	end
end)

print("^9BrownyProd ^4| ^6BNJ Homme Efficace ^4| ^3Sarish ^4 | SP")