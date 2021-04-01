Config              = {}

Config.Lang = "FR"

Config.Exersices = {     
	{type = 'exercices des bras', scenario = "world_human_muscle_free_weights", x = 686.1,y = 92.7,z = 80.75},
	{type = 'des pompes', scenario = "world_human_push_ups", x = 691.68,y = 96.97,z = 80.75},
	{type = 'des sit ups', scenario = "world_human_sit_ups", x = 683.97, y = 97.77,z = 81.0, fixedChinPos = {x = 684.12, y = 97.79, z = 81.35, rot = 93.2}},
	{type = 'sit ups', scenario = "world_human_sit_ups", x = -1206.1055,y = -1565.1589,z = -4.6115},
	{type = 'traction', scenario = "prop_human_muscle_chin_ups", x = 696.0, y = 94.12,z = 80.75, fixedChinPos = {x = 696.0, y = 94.15, z = 80.88, rot = 331.24}},
}

Config.ExersiceKey = 38 -- E
Config.ExersiceDuration = 40 -- in seconds
  
PedCoiffeur = { -- Cops Men LSPD
{ x = 658.94,   y = 94.8, z = 82.94, heading = 217.18 }
}

Config.Animation = {
    Active = true,
    Time = 2500 -- Miliseconds
}

Config.ticketSortie = 150
Config.Animation1 = {
    Active = true,
    Time = 5000 -- Miliseconds
}

Config.Uniforms = {
	prison_vetement = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 0,   ['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 12,
			['shoes_2']  = 12,  ['chain_1']  = 50,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 3,   ['tshirt_2'] = 0,
			['torso_1']  = 38,  ['torso_2']  = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 2,   ['pants_1']  = 3,
			['pants_2']  = 15,  ['shoes_1']  = 66,
			['shoes_2']  = 5,   ['chain_1']  = 0,
			['chain_2']  = 2
		}
	}
}

Config.Text= {
	["FR"] ={
	RageUiMenuTitle = "Sortie",
	RageUiMenuText = "~y~Prisonnier : ",
	
	RageUiMenuTitle2 = "Cantine",
	RageUiMenuText2 = "~y~Prisonnier : ",
	
	RageUiMenuTitle3 = "Isayah",
	RageUiMenuText3 = "Acheter une arme",
	
	RageUiMenuTitle4 = "Entrée Prison",
	RageUiMenuText4 = "~y~Prisonnier : ",
	
	RageUiMenuTitle5 = "Prison Tenue",
	RageUiMenuText5 = "~y~Prisonnier : ",
	
	RageUiMenuTitle6 = "Prison Recyclerie",
	RageUiMenuText6 = "~y~Prisonnier : ",
	
	NotifText1 = "Appuyez sur ~INPUT_CONTEXT~ pour sortir",
	NotifText2 = "Appuyez sur ~INPUT_CONTEXT~ pour acheter à manger",
	NotifText3 = "Appuyez sur ~INPUT_CONTEXT~ pour parler a Isayah",
	NotifText4 = "Appuyez sur ~INPUT_CONTEXT~ pour déposer vos affaires et vous changer",
	NotifText5 = "Appuyez sur ~INPUT_TALK~ pour reprendre votre tenue civil",
	NotifText6 = "Appuyez sur ~INPUT_TALK~ pour vendre les pièces à recycler",
	
	DrawText1 = "~y~[E] ~w~Collecte d\'objets",
	DrawText2 = "~y~[E] ~w~Collecte d\'objets",
	
	RageUIButtonText = "Demander la permission de sortir",
	
	RageUIButtonTitle1 = "Plateau-repas",
	RageUIButtonTitle2 = "Eau",
	RageUIButtonTitle3 = "Poignard",
	RageUIButtonTitle4 = "Pied de biche",
	
	RageUIButtonMoney = "Tickets",
	
	RageUISeparator = "Nombre de tickets en possession:",
	
	RageUIButtonLeave = "Sortir",
	
	RageUIButton2 = "Déposer ses affaires et se changer ",
	
	RageUIButtonSell = "Vendre les pièces",
	
	RageUIButtonOutFit = "Remettre sa tenue civil",
	
	RageUICommandText = "Tiens, prends ta merde !",
	
	RageUIGuardianOutFit  = "~g~Gardien : ~s~Change toi ici",
	
	RageUIShower = "Appuyez sur ~INPUT_CONTEXT~ pour prendre votre douche",
	
	
	
	SRageUIFree = "Vous êtes Libre !",
	
	SRageUIWork = "~r~Retourne travailler !",
	
	SRageBuyBread = "Vous avez acheté un plateau-repas",
	
	SRageNotEnoughTickets = "Vous n\'avez pas assez de tickets",
	
	SRageBuyWater = "Vous avez acheté de ~b~l\'eau",
	
	SRageWeapnAlreadyOwned = "Vous avez déjà cette arme",
	
	SRageBuyKnife = "Vous avez acheté un ~b~ couteau",
	
	SRageCollected = " Objets collectés",

	DrawTextCantine = "[~y~E~w~] Pour manger\n[~y~X~w~] Pour finir le repas",

	cantineneed = "~r~Vous avez besoin d'un plateau repas!",

	pipi = "[~y~E~w~] Pipi",

	caca = "[~y~U~w~] Caca",

	ExersiceString = "Appuyez sur ~g~E~s~ pour ~o~faire du sport",

	AbortString = "Appuyez sur ~g~E~s~ pour abandonner l\'entraînement",

	FinishString = "~g~Exercice terminé! ~s~Prenez une profonde inspiration avant de continuer.",

	TattoBuy = "Se faire tatouer.",

	TattoSpeak = "Appuyez sur ~INPUT_TALK~ pour parler.",	

	cheveux = "Se faire couper les cheveux",

	Camerror = "Cette caméra semble défectueuse",

	Camera =  "Caméra",

	sassoir =  "[~y~E~w~] ~w~S\'asseoir\n\n[~y~X~w~] Se lever",

	livre =  "\n[~y~U~w~] Lire un livre",

	TextCam =  "[~y~E~w~] Caméra",	

	TextCam2 =  "Touche Caméra :",

	TextCam3 =  "Caméra de base : 3",		

	TextCam4 =  "S = bas / D = haut",	

	TextCam5 =  "1 ou & = tourner",		

	TextCam6 =  "Espace pour fermer"	


	},
	
	
	
	
	
	["EN"] = {
	RageUiMenuTitle = "Exit",
	RageUiMenuText = "~y~Prisoner : ",
	
	RageUiMenuTitle2 = "Cafeteria",
	RageUiMenuText2 = "~y~Prisoner : ",
	
	RageUiMenuTitle3 = "Isayah",
	RageUiMenuText3 = "Buy Weapon",
	
	RageUiMenuTitle4 = "Jail Entry",
	RageUiMenuText4 = "~y~Prisoner : ",
	
	RageUiMenuTitle5 = "Jail Outfit",
	RageUiMenuText5 = "~y~Prisoner : ",
	
	RageUiMenuTitle6 = "Jail Recycling Center",
	RageUiMenuText6 = "~y~Prisoner : ",
	
	NotifText1 = "Press ~INPUT_CONTEXT~ to exit",
	NotifText2 = "Press ~INPUT_CONTEXT~ to buy food",
	NotifText3 = "Press ~INPUT_CONTEXT~ to speak to Isayah",
	NotifText4 = "Press ~INPUT_CONTEXT~ to give your clothes and put the prisoner outfit",
	NotifText5 = "Press ~INPUT_TALK~ to put your civilian outfit",
	NotifText6 = "Press ~INPUT_TALK~ to sell your parts to be recycled",
	
	DrawText1 = "~y~[E] ~w~Objects Collected",
	DrawText2 = "~y~[E] ~w~Objects Collected",
	
	RageUIButtonText = "Ask permission to exit",
	
	RageUIButtonTitle1 = "Meal trays",
	RageUIButtonTitle2 = "Water",
	RageUIButtonTitle3 = "Knife",
	RageUIButtonTitle4 = "Crowbar",
	
	RageUIButtonMoney = "Tickets",
	
	RageUISeparator = "Number of tickets in possession:",
	
	RageUIButtonLeave = "Leave",
	
	RageUIButton2 = "Drop off your stuff and dress up ",
	
	RageUIButtonSell = "Sell objects",
	
	RageUIButtonOutFit = "Take back civilian outfit",
	
	RageUICommandText = "Take your Shit, 'Bro' !",
	
	RageUIGuardianOutFit  = "~g~Prison guard : ~s~Dress Up Here !",
	
	
	
	RageUIShower = "Press ~INPUT_CONTEXT~ to take your shower.",
	
	SRageUIFree = "You're Free !",
	
	SRageUIWork = "Go back to Work !",
	
	SRageBuyBread = "You have purchased a Meal Tray",
	
	SRageNotEnoughTickets = "You Haven't enough tickets",
	
	SRageBuyWater = "You've bought Water",
	
	SRageWeapnAlreadyOwned = "You already have this weapon",
	
	SRageBuyKnife = "You've bought a Knife",
	
	SRageCollected = " Objects collected",

	DrawTextCantine = "[~y~E~w~] To eat\n[~y~X~w~] To finish the meal",

	cantineneed = "~r~You need a meal tray!",

	pipi = "[~y~E~w~] Pee",

	caca = "[~y~U~w~] Poop",	

	ExersiceString = "Press ~g~E~s~ to ~o~exercise",

	AbortString = "Press ~g~E~s~ to quit the workout",

	FinishString = "~g~Exercise finished! ~s~ Take a deep breath before continuing.",

	TattoBuy = "Getting a tattoo.",

	TattoSpeak = "Press ~INPUT_TALK~ to talk.",

	tattoneed = "~r~ You need 20 tickets!",

	cheveux = "Have a haircut",

	Camerror = "This camera appears to be faulty",

	Camera =  "Camera",

	sassoir =  "[~y~E~w~] ~w~Sit\n\n[~y~X~w~] Get up",

	livre =  "\n[~y~U~w~] Read a book",

	TextCam =  "[~y~E~w~] Camera",

	TextCam2 =  "Camera key :",	

	TextCam3 =  "Base camera : 3",

	TextCam4 =  "S = down / D = up",	

	TextCam5 =  "1 or & = turn",		

	TextCam6 =  "Space to close"	

	}
}