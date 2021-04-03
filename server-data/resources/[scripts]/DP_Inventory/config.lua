Config = {}
Config.ServerName = 'EMC911 Local Test Server'
Config.Locale = 'en' -- Currently supported: nl, en, tr, fr, br, de, fa, pt, es. Your translation file is really appreciated. Send it to our Github repo or Discord server.
Config.ExcludeAccountsList = {'bank', 'money'} -- DO NOT TOUCH!

Config.IncludeCash = true -- Include cash in inventory? true or false.
Config.IncludeAccounts = true -- Include accounts (bank, black money, ...)? true or false.
Config.CameraAnimationPocket = false -- Set camera focus towards player if in inventory.
Config.CameraAnimationBag = false -- Set camera focus towards player if in inventory.
Config.CameraAnimationTrunk = false -- Set camera focus towards player if in inventory.
Config.CameraAnimationGlovebox = false -- Set camera focus towards player if in inventory.
Config.EverybodyCanRob = true -- Rob a dead or mugging or handcuffed person or allow jobs only?
Config.JobOnlyInventory = true -- Can jobs use /openinventory ID from anywere? If False only admins can do this.
Config.AllowModerators = false -- Can moderators use /openinventory ID from anywere?
Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in trunk and glovebox. Only if this is on TRUE Config.AllowJOBNAME will work.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.
Config.AllowNightclub = true -- If true, nightclub will be able to search players' trunks.
Config.AllowMafia = true -- If true, mafia will be able to search players' trunks.
Config.IllegalshopOpen = false -- if true everybody can enter this shop. If false only Config.InventoryJob.Illegal can enter this shop.
Config.UseLicense = true -- You must have esx_license working on your server. 
Config.useAdvancedShop = false -- es_extended shop system. Not shared, sorry. Just set to false and use the in-build custom shop.
Config.disableVersionCheck = false
Config.disableVersionMessage = false
Config.versionCheckDelay = 10 -- In minutes

Config.Command = {Steal = 'steal', CloseInv = 'closeinventory', Unequip = 'unequip'} -- NOT YET SUPPORTED, CHANGE IN /server/main.lua/.
Config.Attachments = {'flashlight', 'mag', 'drummag', 'suppressor', 'scope', 'grip', 'skin', 'skin1', 'skin2', 'skin3', 'skin4', 'skin5', 'skin6','skin7'} -- SUPPORTED.
Config.InventoryJob = {Police = 'police', Nightclub = 'nightclub', Mafia = 'mafia', Illegal = nil, Ambulance = 'ambulance'} -- This must be the name used in your database/jobs table.
Config.CloseUiItems = {'phone', 'weed_seed', 'tunerchip', 'fixkit', 'medikit', 'firstaid', 'vicodin', 'adrenaline', 'vuurwerk', 'vuurwerk2', 'vuurwerk3', 'vuurwerk4', 'armbrace', 'neckbrace', 'bodybandage', 'legbrace', 'bandage', 'billet'} -- List of item names that will close ui when used.
Config.License = {Weapon = 'weapon', Police = 'weapon', Nightclub = 'weapon'} -- What license is needed for this shop?

Config.OpenControl = 289 -- F2. player inventory, it is recommend to use the same as CloseControl.
Config.CloseControl = 289 -- F2. player inventory, it is recommend to use the same as OpenControl.
Config.BagControl = 288 -- F4. player bag inventory
Config.SearchBag = 249 -- N. Search a bag on the ground
Config.TakeBag = 38 -- E. Take bag on the ground
Config.OpenKeyGlovebox = 170 -- F3. glovebox inventory (in-car), it is recommend to use the same as OpenKeyTrunk.
Config.OpenKeyTrunk = 170 -- F3. trunk inventory (behind-car), it is recommend to use the same as OpenKeyGlovebox.
Config.RobKeyOne = 38 -- E
Config.RobKeyTwo = 60 -- CTRL

Config.ReloadTime = 2000 -- in miliseconds for reloading your ammunition.

Config.InitialLockerRentPrice = 450
Config.DailyLockerRentPrice = 250
Config.LockerExterior = vector3(-286.23, 280.84, 89.89)
Config.LockerInterior = vector3(1173.24, -3196.62, -39.01)

Config.Lockers = {

	['locker1'] = {
		locker_name = 'Kluisje #1',
		location = vector3(1161.87, -3199.07, -39.01),
	},
	
	['locker2'] = {
		locker_name = 'Kluisje #2',
		location = vector3(1156.71, -3195.3, -39.01),
	},
	
	['locker3'] = {
		locker_name = 'Kluisje #3',
		location = vector3(1157.61, 3198.92, -39.01),
	},
	
	['locker4'] = {
		locker_name = 'Kluisje #4',
		location = vector3(1167.05, -3194.64, -39.01),
	},
	
	['locker5'] = {
		locker_name = 'Kluisje #5',
		location = vector3(1173.29, -3194.47, -39.01),
	},
	
	['locker6'] = {
		locker_name = 'Kluisje #6',
		location = vector3(1171.73, -3198.81, -39.01),
	},
	
}

Config.LicensePrice = 25000

Config.ShopMinimumGradePolice = 9 -- minimum grade to open the police shop
Config.ShopMinimumGradeNightclub = 0
Config.ShopMinimumGradeMafia = 0

-- BLIPS & MARKERS
Config.MarkerSize = {x = 1.5, y = 1.5, z = 1.5}
Config.MarkerColor = {r = 0, g = 128, b = 255}
Config.Color = 0 -- currently used for most shop blip color.
Config.WeaponColor = 1 -- to be optimized....

Config.ShowDrugMarketBlip = true
Config.DrugStoreBlipID = 140
Config.ShowRegularShopBlip = true
Config.ShopBlipID = 59
Config.ShowRobsLiquorBlip = true
Config.LiquorBlipID = 93
Config.ShowYouToolBlip = true
Config.YouToolBlipID = 402
Config.ShowBlackMarketBlip = false
Config.BlackMarketBlipID = 110
Config.ShowPoliceShopBlip = true
Config.PoliceShopBlipID = 110
Config.ShowNightclubShopBlip = false
Config.NightclubShopBlipID = 110
Config.ShowWeaponShopBlip = true
Config.WeaponShopBlipID = 110
Config.ShowIllegalShopBlip = false
Config.IllegalShopBlipID = 110
Config.ShowPrisonShopBlip = true
Config.PrisonShopBlipID = 52
Config.ShowLockerRentBlip = true
Config.LockerRentBlipID = 357
Config.LockerRentBlipSize = 1.0
Config.LockerRentBlipColor = 3

Config.Weight = 80000 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg).
Config.DefaultWeight = 1 -- Default weight for an item.
Config.MaxBagWeight = 20000
Config.MaxBagItemCount = 50
Config.MaxDifferentBagItems = 5

Config.localWeight = { -- Fill this with all your items. This is only for trunk and glovebox! Change your pocket inventory weights in your database! (items table)
	bag_bread = 500,
	bread = 80,
	snickers = 30,
	chocolate = 80,
	jelly_beans = 300,
	chips = 300,
	corn_chips = 150,
	nuts = 100,
	french_fries = 80,
	hot_dogs = 50,
	sandwich = 80,
	dogfood = 80,
	bagdogfoor = 800,
	pistachio = 100,
	water = 600,
	bag_water = 14400,
	coke = 300,
	fanta = 300,
	red_bull = 300,
	beer2 = 3600,
	beer = 600,
	wine = 750,
	soda = 300,
	coffee = 250,
	milktea = 250,
	milk = 250,
	yogurt = 100,
	whisky = 750,
	vodka = 750,
	tequila = 750,
	rum = 750,
	boxcig = 100,
	cigarette = 0,
	cigarette2 = 10,
	lighter = 100,
	phone = 200,
	beefyfritosburrito = 300,
	beefyminiquesadilla = 300,
	appleempanada = 300,
	cheesybean_riceburrito = 300,
	cheeserollup = 300,
	cinnamontwists = 300,
	chickenminiquesadilla = 300,
	spicypotatosofttaco = 300,
	spicytostada = 300,
	triplelayernachos = 300,
	drpeppervanilla = 500,
	mtn_dew = 500,
	starburststrawberry = 500,
	starburstcherry = 500,
	firecrackerchickenbreast = 500,
	orangechicken = 500,
	honeysesamechickenbreast = 500,
	firecrackershrimp = 500,
	honeywalnutshrimp = 500,
	fiveflavorshrimp = 500,
	chopsuey = 500,
	sichuanhotchicken = 500,
	generaltso_chicken = 500,
	sweetfirechickenbreast = 500,
	shanghaiangussteak = 500,
	kungpaochicken = 500,
	grilledteriyakichicken = 500,
	broccolibeef = 500,
	beijingbeef = 500,
	veggiespringroll = 300,
	eggplanttofu = 300,
	chomein = 400,
	friedrice = 400,
	fortunecookies = 10,
	orangejuice = 500,
	applejuice = 500,
	water = 600,
	softdrink = 500,
	coke = 300,
	bigmac = 300,
	cheeseburgers = 300,
	bacon_clubhouse_burger = 300,
	crispy_chicken_deluxe = 300,
	premium_mcwrap = 300,
	filet_o_fish = 300,
	chickennugget = 300,
	largefries = 300,
	egg_mcmuffin = 300,
	sundae = 150,
	pies = 100,
	oreo_mcflurry = 150,
	softdrink = 500,
	mccafe_shakes = 500,
	orange_juice = 500,
	hotchocolate = 300,
	icedmocha = 200,
	smoothies = 300,
	whopper = 300,
	texasdoublewhopper = 300,
	impossiblewhopper = 300,
	baconking = 300,
	whopper_jr = 300,
	baconcheeseburger = 300,
	originalchickensandwich = 300,
	valuefries = 300,
	onionrings = 300,
	chicken_nuggets = 300,
	chickenclubsalad = 300,
	sundaepie = 200,
	bkshakes = 500,
	orangejuice = 500,
	applejuice = 500,
	water = 600,
	meth = 500,
	acetone = 500,
	coco_leaf = 500,
	cannabis = 500,
	coco = 500,
	marijuana = 500,
	weed = 500,
	medikit = 1000,
	bandage = 20,
	firstaid = 900,
	medkit = 500,
	morphine = 1,
	tylenol = 1,
	aspirin = 1,
	blowpipe = 2000,
	carokit = 2000,
	carotool = 2000,
	fixkit = 3000,
	bag1g = 1,
	bag5g = 5,
	bag50g = 50,
	bag100g = 100,
	lowgradefert = 500,
	highgradefert = 500,
	drill = 500,
	lithium = 10,
	oxygen_mask = 500,
	sim = 1,
	rollingpaper = 1,
	hifi = 2000,
	scubagear = 1000,
	gold = 500,
	stone = 500,
	wood = 500,
	iron = 500,
	steel = 500,
	copper = 500,
	emerald = 500,
	diamond = 500,
	meat = 500,
	potato = 10,
	joint = 1000,
	microchip = 1,
	jewels = 1000,
	lockpick = 20,
	net_cracker = 300,
	thermite = 500,
	rolex = 10,
	pendrive = 200,
	goldbar = 500,
	methlab = 500,
	radio = 100,
	cuffs = 50,
	cuff_keys = 1,
	clip = 5000,
	lokalizator = 1,
	armor = 3200,
	binocular = 100,
	gps = 100,
	pdbadge = 10,
	trailburst = 100,
	fountain = 100,
	starburst = 100,
	shotburst = 100,
	plantpot = 100,
	up_hat_001 = 50,
	up_hat_002 = 50,
	up_hat_003 = 50,
	up_hat_004 = 50,
	up_hat_005 = 50,
	up_hat_006 = 50,
	up_hat_007 = 50,
	up_hat_008 = 50,
	up_hat_009 = 50,
	up_hat_010 = 50,
	up_hat_011 = 50,
	up_hat_012 = 50,
	up_hat_013 = 50,
	up_hat_014 = 50,
	up_hat_015 = 50,
	up_hat_016 = 50,
	up_hat_017 = 50,
	up_hat_018 = 50,
	up_hat_019 = 50,
	up_hat_020 = 50,
	up_hat_021 = 50,
	up_hat_022 = 50,
	up_hat_023 = 50,
	up_hat_024 = 50,
	up_hat_025 = 50,
	up_hat_026 = 50,
	up_hat_027 = 1500,
	up_hat_028 = 1500,
	up_hat_029 = 50,
	up_hat_030 = 1500,
	up_hat_031 = 1500,
	up_hat_032 = 1500,
	up_hat_033 = 1500,
	up_hat_034 = 1500,
	up_hat_035 = 1500,
	up_hat_036 = 1500,
	up_hat_037 = 1500,
	up_holster_1 = 500,
	up_holster_2 = 500,
	up_holster_3 = 500,
	up_holster_4 = 500,
	up_holster_5 = 500,
	up_holster_6 = 500,
	up_holster_7 = 500,
	up_holster_8 = 500,
	up_holster_9 = 500,
	up_holster_10 = 500,
	up_mask_001 = 200,
	up_mask_002 = 200,
	up_mask_003 = 200,
	up_mask_004 = 200,
	up_mask_005 = 200,
	up_mask_006 = 200,
	up_mask_007 = 200,
	up_mask_008 = 200,
	up_mask_009 = 200,
	up_mask_010 = 200,
	up_mask_011 = 200,
	up_axon_001 = 500,
	up_axon_002 = 500,
	up_axon_003 = 500,
	up_axon_004 = 500,
	up_axon_005 = 500,
	up_axon_006 = 500,
	up_axon_007 = 500,
	up_axon_008 = 500,
	up_axon_009 = 500,
	up_axon_010 = 500,
	up_badge_001 = 200,
	up_badge_002 = 200,
	up_badge_003 = 200,
	up_badge_004 = 200,
	up_badge_005 = 200,
	up_badge_006 = 200,
	up_belt_001 = 3000,
	up_belt_002 = 3000,
	up_belt_003 = 3000,
	up_belt_004 = 3000,
	up_belt_005 = 3000,
	up_belt_006 = 3000,
	up_belt_007 = 3000,
	up_belt_008 = 3000,
	up_belt_009 = 3000,
	up_belt_010 = 3000,
	up_belt_011 = 3000,
	up_belt_012 = 3000,
	up_belt_013 = 3000,
	up_belt_014 = 3000,
	up_belt_015 = 3000,
	up_belt_016 = 3000,
	up_belt_017 = 3000,
	up_belt_018 = 3000,
	up_belt_019 = 3000,
	up_belt_020 = 3000,
	up_belt_021 = 3000,
	up_belt_022 = 3000,
	up_belt_023 = 3000,
	up_belt_024 = 3000,
	up_belt_025 = 3000,
	up_belt_026 = 3000,
	up_belt_027 = 3000,
	up_belt_028 = 3000,
	up_belt_029 = 3000,
	up_belt_030 = 3000,
	up_belt_031 = 3000,
	up_belt_032 = 3000,
	up_belt_033 = 3000,
	up_belt_034 = 3000,
	up_belt_035 = 3000,
	up_belt_036 = 3000,
	up_belt_037 = 3000,
	up_belt_038 = 3000,
	up_belt_039 = 3000,
	up_belt_040 = 3000,
	up_belt_041 = 3000,
	up_belt_042 = 3000,
	up_belt_043 = 3000,
	up_belt_044 = 3000,
	up_belt_045 = 3000,
	up_belt_046 = 3000,
	up_belt_047 = 3000,
	up_belt_048 = 3000,
	up_belt_049 = 3000,
	up_belt_050 = 3000,
	up_vest_001 = 5000,
	up_vest_002 = 5000,
	up_vest_003 = 5000,
	up_vest_004 = 5000,
	up_vest_005 = 5000,
	up_vest_006 = 5000,
	up_vest_007 = 5000,
	up_vest_008 = 5000,
	up_vest_009 = 5000,
	up_vest_010 = 5000,
	up_vest_011 = 5000,
	up_vest_012 = 5000,
	up_vest_013 = 5000,
	up_vest_014 = 5000,
	up_vest_015 = 5000,
	up_vest_016 = 5000,
	up_vest_017 = 5000,
	up_vest_018 = 5000,
	up_vest_019 = 5000,
	up_vest_020 = 5000,
	up_vest_021 = 5000,
	up_vest_022 = 5000,
	up_vest_023 = 5000,
	up_vest_024 = 5000,
	up_vest_025 = 5000,
	up_vest_026 = 5000,
	up_vest_027 = 5000,
	up_vest_028 = 5000,
	up_vest_029 = 5000,
	up_vest_030 = 5000,
	up_vest_031 = 5000,
	up_vest_032 = 5000,
	up_vest_033 = 5000,
	up_vest_034 = 5000,
	up_vest_035 = 5000,
	up_vest_036 = 5000,
	up_vest_037 = 5000,
	up_vest_038 = 5000,
	up_vest_039 = 5000,
	up_vest_040 = 5000,
	up_vest_041 = 5000,
	up_vest_042 = 5000,
	up_vest_043 = 5000,
	up_vest_044 = 5000,
	up_vest_045 = 5000,
	up_vest_046 = 5000,
	up_vest_047 = 5000,
	up_vest_048 = 5000,
	up_vest_049 = 5000,
	up_vest_050 = 5000,
	up_vest_051 = 5000,
	up_vest_052 = 5000,
	up_vest_053 = 5000,
	up_vest_054 = 5000,
	up_vest_055 = 5000,
	up_vest_056 = 5000,
	up_vest_057 = 5000,
	up_vest_058 = 5000,
	up_vest_059 = 5000,
	up_vest_060 = 5000,
	up_vest_061 = 5000,
	up_vest_062 = 5000,
	up_vest_063 = 5000,
	up_vest_064 = 5000,
	up_vest_065 = 5000,
	up_vest_066 = 5000,
	up_vest_067 = 5000,
	up_vest_068 = 5000,
	up_vest_069 = 5000,
	up_vest_070 = 5000,
	up_vest_071 = 5000,
	up_vest_072 = 5000,
	weapon_combatpistol = 900,
	weapon_pistol = 1100,
	weapon_pistol_mk2 = 900,
	weapon_appistol = 1000,
	weapon_stungun = 380,
	weapon_pistol50 = 3000,
	weapon_snspistol = 840,
	weapon_snspistol_mk2 = 900,
	weapon_heavypistol = 1130,
	weapon_vintagepistol = 600,
	weapon_flaregun = 400,
	weapon_marksmanpistol = 2500,
	weapon_revolver = 2320,
	weapon_revolver_mk2 = 2500,
	weapon_doubleaction = 1300,
	weapon_ceramicpistol = 500,
	weapon_microsmg = 1000,
	weapon_smg = 3000,
	weapon_smg_mk2 = 3000,
	weapon_assaultsmg = 3200,
	weapon_combatpdw = 3000,
	weapon_machinepistol = 1400,
	weapon_minismg = 1390,
	weapon_gusenberg = 3860,
	weapon_pumpshotgun = 3600,
	weapon_pumpshotgun_mk2 = 3600,
	weapon_sawnoffshotgun = 3000,
	weapon_assaultshotgun = 6000,
	weapon_bullpupshotgun = 8500,
	weapon_musket = 9000,
	weapon_heavyshotgun = 6000,
	weapon_dbshotgun = 2000,
	weapon_autoshotgun = 8500,
	weapon_assaultrifle = 4600,
	weapon_assaultrifle_mk2 = 4000,
	weapon_carbinerifle = 4400,
	weapon_carbinerifle_mk2 = 3020,
	weapon_advancedrifle = 3500,
	weapon_specialcarbine = 3000,
	weapon_specialcarbine_mk2 = 3000,
	weapon_bullpuprifle = 3500,
	weapon_bullpuprifle_mk2 = 3400,
	weapon_compactrifle = 3000,
	weapon_mg = 9500,
	weapon_combatmg = 10700,
	weapon_combatmg_mk2 = 10900,
	weapon_sniperrifle = 6800,
	weapon_heavysniper = 14000,
	weapon_heavysniper_mk2 = 15000,
	weapon_marksmanrifle = 4500,
	weapon_marksmanrifle_mk2 = 4300,
	weapon_grenadelauncher = 10000,
	weapon_firework = 12000,
	weapon_grenade = 390,
	weapon_bzgas = 250,
	weapon_smokegrenade = 250,
	weapon_molotov = 750,
	weapon_snowball = 2630,
	weapon_pipebomb = 500,
	weapon_ball = 100,
	weapon_flare = 200,
	weapon_petrolcan = 3000,
	gadget_parachute = 2000,
	weapon_fireextinguisher = 2000,
	weapon_hazardcan = 3000,
	weapon_nightstick = 320,
	weapon_knife = 240,
	weapon_dagger = 400,
	weapon_bat = 900,
	weapon_bottle = 100,
	weapon_crowbar = 8000,
	weapon_flashlight = 100,
	weapon_golfclub = 600,
	weapon_hammer = 300,
	weapon_hatchet = 3000,
	weapon_knuckle = 50,
	weapon_machete = 400,
	weapon_switchblade = 100,
	weapon_wrench = 1000,
	weapon_battleaxe = 3000,
	weapon_poolcue = 3200,
	weapon_stone_hatchet = 5000
}

Config.GloveboxSize = { -- Related to Config.localWeight.
	[0] = 30000, --Compact
	[1] = 40000, --Sedan
	[2] = 70000, --SUV
	[3] = 25000, --Coupes
	[4] = 30000, --Muscle
	[5] = 10000, --Sports Classics
	[6] = 5000, --Sports
	[7] = 5000, --Super
	[8] = 5000, --Motorcycles
	[9] = 180000, --Off-road
	[10] = 300000, --Industrial
	[11] = 70000, --Utility
	[12] = 100000, --Vans
	[13] = 0, --Cycles
	[14] = 5000, --Boats
	[15] = 20000, --Helicopters
	[16] = 0, --Planes
	[17] = 40000, --Service
	[18] = 40000, --Emergency
	[19] = 0, --Military
	[20] = 300000, --Commercial
	[21] = 0 --Trains
}

Config.TrunkSize = { -- Related to Config.localWeight.
	[0] = 300000, --Compact
	[1] = 400000, --Sedan
	[2] = 700000, --SUV
	[3] = 250000, --Coupes
	[4] = 300000, --Muscle
	[5] = 100000, --Sports Classics
	[6] = 50000, --Sports
	[7] = 50000, --Super
	[8] = 50000, --Motorcycles
	[9] = 1800000, --Off-road
	[10] = 3000000, --Industrial
	[11] = 700000, --Utility
	[12] = 1000000, --Vans
	[13] = 0, --Cycles
	[14] = 50000, --Boats
	[15] = 200000, --Helicopters
	[16] = 0, --Planes
	[17] = 400000, --Service
	[18] = 400000, --Emergency
	[19] = 0, --Military
	[20] = 3000000, --Commercial
	[21] = 0 --Trains
}

Config.VehiclePlate = {
	taxi = 'TAXI',
	cop = 'police',
	police = 'police',
	ambulance = 'ambulance',
	mecano = 'mechano',
	mechanic = 'mechanic',
	police = 'police',
	nightclub = 'nightclub',
	nightclub = 'nightclub',
	bahamas = 'bahamas',
	cardealer = 'dealer'
}

Config.Shops = {
	RegularShop = {
		Locations = {
			{x = 190.7,   y = -888.52,  z = 29.71},
			{x = 374.875,   y = 327.896,  z = 102.566},
			{x = 2557.458,  y = 382.282,  z = 107.622},
			{x = -3038.939, y = 585.954,  z = 6.908},
			{x = -3241.927, y = 1001.462, z = 11.830},
			{x = 547.431,   y = 2671.710, z = 41.156},
			{x = 1961.464,  y = 3740.672, z = 31.343},
			{x = 2678.916,  y = 3280.671, z = 54.241},
			{x = 1729.216,  y = 6414.131, z = 34.037},
			{x = -48.519,   y = -1757.514, z = 28.421},
			{x = 1163.373,  y = -323.801,  z = 68.205},
			{x = -707.501,  y = -914.260,  z = 18.215},
			{x = -1820.523, y = 792.518,   z = 137.118},
			{x = 1698.388,  y = 4924.404,  z = 41.063},
			{x = 25.723,   y = -1346.966, z = 28.497}
		},
		Items = {
			{name = 'bag_bread', price = 5},
			{name = 'bread', price = 1},
			{name = 'snickers', price = 1},
			{name = 'chocolate', price = 1},
			{name = 'jelly_beans', price = 3},
			{name = 'chips', price = 3},
			{name = 'corn_chips', price = 3},
			{name = 'nuts', price = 3},
			{name = 'french_fries', price = 2},
			{name = 'hot_dogs', price = 2},
			{name = 'sandwich', price = 3},
			{name = 'dogfood', price = 1},
			{name = 'bagdogfoor', price = 10},
			{name = 'pistachio', price = 4},
			{name = 'water', price = 1},
			{name = 'bag_water', price = 20},
			{name = 'coke', price = 1},
			{name = 'fanta', price = 1},
			{name = 'red_bull', price = 3},
			{name = 'beer2', price = 15},
			{name = 'beer', price = 3},
			{name = 'wine', price = 20},
			{name = 'soda', price = 1},
			{name = 'coffee', price = 3},
			{name = 'milktea', price = 5},
			{name = 'milk', price = 2},
			{name = 'yogurt', price = 1},
			{name = 'whisky', price = 26},
			{name = 'vodka', price = 15},
			{name = 'tequila', price = 15},
			{name = 'rum', price = 13},
			{name = 'boxcig', price = 8},
			{name = 'cigarette', price = 10},
			{name = 'cigarette2', price = 10},
			{name = 'lighter', price = 1},
			{name = 'phone', price = 1000}
		}
	},

	GroothandelSupermarkt = {
		Locations = {
			{ x = 50.57, y = -1754.93, z = 28.61 }
		},
		Items = {
			{ name = 'bread', price = 1},
			{ name = 'water', price = 1},
			{ name = 'medikit', price = 1000},
			{ name = 'bandage', price = 25},
			{ name = 'cough_med', price = 2},
			{ name = 'hoestdrank', price = 2},
			{ name = 'antibiotico', price = 5},
			{ name = 'antibioticorosacea', price = 10},
			{ name = "bodybandage",       price = 50},
			{ name = "neckbrace",       price = 50},
			{ name = "armbrace",       price = 50},
			{ name = "legbrace",       price = 50},
			{ name = "croquettes",       price = 3},
			{ name = "martini",       price = 3},
			{ name = "tequila",       price = 3},
			{ name = "whisky",       price = 3},
			{ name = "rhum",       price = 3},
			{ name = "vodka",       price = 3},
			{ name = "tyton",       price = 3},
			{ name = "jagercerbere",       price = 4},
			{ name = "mixapero",       price = 4},
			{ name = "mojito",       price = 4},
			{ name = "rhumcoca",       price = 4},
			{ name = "rhumfruit",       price = 4},
			{ name = "vodkafruit",       price = 4},
			{ name = "vodkaenergy",       price = 4},
			{ name = "whiskycoca",       price = 4},
			{ name = "jagerbomb",       price = 4},
			{ name = "hamburger",       price = 5},
			{ name = "bolchips",       price = 1},
			{ name = "bolpistache",       price = 1},
			{ name = "bolnoixcajou",       price = 1},
			{ name = "bolcacahuetes",       price = 1},
			{ name = "limonade",       price = 2},
			{ name = "drpepper",       price =3},
			{ name = "energy",       price = 3},
			{ name = "icetea",       price = 3},
			{ name = "jusfruit",       price = 3},
			{ name = "wine",       price = 4},
			{ name = "smoothie",       price = 3},
			{ name = "margarita",       price = 3},
			{ name = "frappe",       price = 4},
			{ name = "latte",       price = 4},
			{ name = "cocktail",       price = 4},
			{ name = "champagne",       price =4},
			{ name = "cappuchino",       price = 4},
			{ name = "milkshake",       price = 4},
			{ name = "milkshake2",       price = 4},
			{ name = "milkshake3",       price = 4},
			{ name = "beercan",       price = 4},
			{ name = "chocolatemilk",       price = 4},
			{ name = "coffeecup",       price = 4},
			{ name = "coconutdrink",       price = 4},
			{ name = "icedcoffee",       price = 4},
			{ name = "icedcoffee2",       price = 4},
			{ name = "fixkit",       price = 1000},
			{ name = "dierenvoeding",       price = 5},
			{ name = "fishbait",       price = 15},
			{ name = "fishingrod",       price = 55},
			{ name = "turtlebait",       price = 35},
			{ name = "lokalizator",       price = 420},
			{ name = "hifi",       price = 25},
			{ name = "raspberry",       price = 50},
			{ name = "phone",       price = 500},
			{ name = "sim",       price = 5},
			{ name = "dildo",       price = 13},
			{ name = "dildo2",       price = 15},
			{ name = "saucisson",       price = 5},
			{ name = "soda",       price = 4},
			{ name = "apple",       price = 4},
			{ name = "aubergine",       price = 5},
			{ name = "avocado",       price = 6},
			{ name = "banana",       price = 4},
			{ name = "beetroot",       price = 5},
			{ name = "broccoli",       price = 5},
			{ name = "carrot",       price = 5},
			{ name = "cherries",       price = 6},
			{ name = "coconut",       price = 8},
			{ name = "corn",       price = 4},
			{ name = "cucumbers",       price = 5},
			{ name = "garlic",       price = 6},
			{ name = "kiwi",       price = 5},
			{ name = "lemon",       price = 5},
			{ name = "mango",       price = 9},
			{ name = "orange",       price = 6},
			{ name = "paprika",       price = 5},
			{ name = "pear",       price = 4},
			{ name = "pineapple",       price = 6},
			{ name = "pumpkin",       price = 5},
			{ name = "radish",       price = 5},
			{ name = "strawberry",       price = 7},
			{ name = "tomato",       price = 5},
			{ name = "tea",       price = 5},
			{ name = "watermelon",       price = 8},
			{ name = "milkbottle",       price = 6},
			{ name = "milkbox",       price = 6},
			{ name = "billet",       price = 55},
			{ name = "cheese",       price = 25},
			{ name = "stroopwafel",       price = 5},
			{ name = "vuurwerk",       price = 25},
			{ name = "vuurwerk2",       price = 25},
			{ name = "vuurwerk3",       price = 25},
			{ name = "vuurwerk4",       price = 25},
			{ name = "duikvrouw0",       price = 185},
			{ name = "duikvrouw1",       price = 185},
			{ name = "duikvrouw12",       price = 185},
			{ name = "duikvrouw13",       price = 185},
			{ name = "duikvrouw14",       price = 185},
			{ name = "duikvrouw15",       price = 185},
			{ name = "duikvrouw16",       price = 185},
			{ name = "duikvrouw17",       price = 185},
			{ name = "duikvrouw18",       price = 185},
			{ name = "duikvrouw19",       price = 185},
			{ name = "duikvrouw2",       price = 185},
			{ name = "duikvrouw3",       price = 185},
			{ name = "duikvrouw4",       price = 185},
			{ name = "duikvrouw5",       price = 185},
			{ name = "duikvrouw6",       price = 185},
			{ name = "duikvrouw7",       price = 185},
			{ name = "duikvrouw8",       price = 185},
			{ name = "duikvrouw9",       price = 185},
			{ name = "duikvrouw10",       price = 185},
			{ name = "duikvrouw20",       price = 185},
			{ name = "duikvrouw21",       price = 185},
			{ name = "duikvrouw22",       price = 185},
			{ name = "duikvrouw23",       price = 185},
			{ name = "duikvrouw24",       price = 185},
			{ name = "duikvrouw25",       price = 185},
			{ name = "duikvrouw26",       price = 185},
			{ name = "general_spray_paint",       price = 200},
			{ name = "bironlack_spray_paint",       price = 200},
			{ name = "sponge",       price = 5},
		}
	},

	IlegalShop = {
		Locations = {
			{ x = 468.58, y = -3205.64, z = 9.79 }
		},
		Items = {
			{ name = 'bread', price = 1},
			{ name = 'water', price = 1}
		}
	},

	DrugShop = {
		Locations = {
			{ x = 377.0, y = -828.49, z = 28.3 }
		},
		Items = {
			{ name = 'joint', price = 10},
			{ name = 'blunt', price = 15}
		}
	},

	RobsLiquor = {
		Locations = {
		 	{ x = 964.38, y = 33.54, z = 73.88 }
		},
		Items = {
			{name = 'beer', price = 12},
			{name = 'wine', price = 12},
			{name = 'vodka', price = 18},
			{name = 'tequila', price = 18},
			{name = 'whiskey', price = 20}
		}
	},

	YouTool = {
		Locations = {
			{ x = 2748.0, y = 3473.0, z = 55.68 }
		},
		Items = {
			{name = 'drill', price = 1},
			{name = 'binocular', price = 1},
			{name = 'fixkit', price = 1},
			{name = 'gps', price = 1},
			{name = 'lockpick', price = 1},
			{name = 'scubagear', price = 1},
			{name = 'blowtorch', price = 1},
			{name = '1gbag', price = 1},
			{name = '5gbag', price = 1},
			{name = '50gbag', price = 1},
			{name = '100gbag', price = 1},
			{name = 'lowgradefert', price = 1},
			{name = 'highgradefert', price = 1},
			{name = 'plantpot', price = 1},
			{name = 'drugscales', price = 1}
		}
	},

	PrisonShop = {
		Locations = {
		 	{ x = -1103.05, y = -823.72, z = 14.48 }
		},
		Items = {
			{name = 'bread', price = 1},
			{name = 'water', price = 1},
			{name = 'cigarette', price = 1},
			{name = 'lighter'}, price = 1,
			{name = 'sandwich', price = 1},
			{name = 'chips', price = 1}
		}
	},

	WeaponShop = {
		Locations = {
			{ x = 22.09, y = -1107.28, z = 28.80 }
		},
		Items = {
			{name = 'weapon_combatpistol', price = 500},
			{name = 'weapon_pistol', price = 500},
			{name = 'weapon_pistol_mk2', price = 500},
			{name = 'weapon_appistol', price = 500},
			{name = 'weapon_stungun', price = 500},
			{name = 'weapon_pistol50', price = 500},
			{name = 'weapon_snspistol', price = 500},
			{name = 'weapon_snspistol_mk2', price = 500},
			{name = 'weapon_heavypistol', price = 500},
			{name = 'weapon_vintagepistol', price = 500},
			{name = 'weapon_flaregun', price = 500},
			{name = 'weapon_marksmanpistol', price = 500},
			{name = 'weapon_revolver', price = 500},
			{name = 'weapon_revolver_mk2', price = 500},
			{name = 'weapon_doubleaction', price = 500},
			{name = 'weapon_ceramicpistol', price = 500},
			{name = 'weapon_microsmg', price = 1500},
			{name = 'weapon_smg', price = 1500},
			{name = 'weapon_smg_mk2', price = 1500},
			{name = 'weapon_assaultsmg', price = 1500},
			{name = 'weapon_combatpdw', price = 1500},
			{name = 'weapon_machinepistol', price = 1500},
			{name = 'weapon_minismg', price = 1500},
			{name = 'weapon_gusenberg', price = 1500},
			{name = 'weapon_pumpshotgun', price = 1000},
			{name = 'weapon_pumpshotgun_mk2', price = 1000},
			{name = 'weapon_sawnoffshotgun', price = 1000},
			{name = 'weapon_assaultshotgun', price = 1000},
			{name = 'weapon_bullpupshotgun', price = 1000},
			{name = 'weapon_musket', price = 1000},
			{name = 'weapon_heavyshotgun', price = 1000},
			{name = 'weapon_dbshotgun', price = 1000},
			{name = 'weapon_autoshotgun', price = 1000},
			{name = 'weapon_assaultrifle', price = 2500},
			{name = 'weapon_assaultrifle_mk2', price = 2500},
			{name = 'weapon_carbinerifle', price = 2500},
			{name = 'weapon_carbinerifle_mk2', price = 2500},
			{name = 'weapon_advancedrifle', price = 2500},
			{name = 'weapon_specialcarbine', price = 2500},
			{name = 'weapon_specialcarbine_mk2', price = 2500},
			{name = 'weapon_bullpuprifle', price = 2500},
			{name = 'weapon_bullpuprifle_mk2', price = 2500},
			{name = 'weapon_compactrifle', price = 2500},
			{name = 'weapon_mg', price = 5000},
			{name = 'weapon_combatmg', price = 5000},
			{name = 'weapon_combatmg_mk2', price = 5000},
			{name = 'weapon_sniperrifle', price = 5000},
			{name = 'weapon_heavysniper', price = 5000},
			{name = 'weapon_heavysniper_mk2', price = 5000},
			{name = 'weapon_marksmanrifle', price = 5000},
			{name = 'weapon_marksmanrifle_mk2', price = 5000},
			{name = 'weapon_grenadelauncher', price = 200},
			{name = 'weapon_firework', price = 200},
			{name = 'weapon_grenade', price = 200},
			{name = 'weapon_bzgas', price = 200},
			{name = 'weapon_smokegrenade', price = 200},
			{name = 'weapon_molotov', price = 200},
			{name = 'weapon_snowball', price = 200},
			{name = 'weapon_pipebomb', price = 200},
			{name = 'weapon_ball', price = 200},
			{name = 'weapon_flare', price = 200},
			{name = 'weapon_petrolcan', price = 200},
			{name = 'gadget_parachute', price = 200},
			{name = 'weapon_fireextinguisher', price = 200},
			{name = 'weapon_hazardcan', price = 200},
			{name = 'weapon_nightstick', price = 200},
			{name = 'weapon_knife', price = 200},
			{name = 'weapon_dagger', price = 200},
			{name = 'weapon_bat', price = 200},
			{name = 'weapon_bottle', price = 200},
			{name = 'weapon_crowbar', price = 200},
			{name = 'weapon_flashlight', price = 200},
			{name = 'weapon_golfclub', price = 200},
			{name = 'weapon_hammer', price = 200},
			{name = 'weapon_hatchet', price = 200},
			{name = 'weapon_knuckle', price = 200},
			{name = 'weapon_machete', price = 200},
			{name = 'weapon_switchblade', price = 200},
			{name = 'weapon_wrench', price = 200},
			{name = 'weapon_battleaxe', price = 200},
			{name = 'weapon_poolcue', price = 200},
			{name = 'weapon_stone_hatchet', price = 200},
			{name = 'ammunition_pistol', price = 1},
			{name = 'ammunition_pistol_large', price = 1},
			{name = 'ammunition_shotgun', price = 1},
			{name = 'ammunition_shotgun_large', price = 1},
			{name = 'ammunition_smg', price = 1},
			{name = 'ammunition_smg_large', price = 1},
			{name = 'ammunition_rifle', price = 1},
			{name = 'ammunition_rifle_large', price = 1},
			{name = 'ammunition_snp', price = 1},
			{name = 'ammunition_snp_large', price = 1},
			{name = 'flashlight',price = 1},
			--{name = 'grip',price = 1},
			--{name = 'scope',price = 1},
			--{name = 'skin',price = 1},
			--{name = 'suppressor',price = 1}
		}
	},

	PoliceShop = { -- available for Config.InventoryJob.Police
		Locations = {
			{ x = 482.68 , y = -995.99, z = 29.69 }
		},
		Items = {
			{name = 'WEAPON_FLASHLIGHT', price = 100},
			{name = 'WEAPON_STUNGUN', price = 100},
			{name = 'WEAPON_NIGHTSTICK', price = 100},
			{name = 'WEAPON_PISTOL', price = 100},
			{name = 'WEAPON_FIREEXTINGUISHER',price = 100},
			{name = 'ammunition_pistol',price = 100},
			{name = 'ammunition_pistol_large',price = 100},
			{name = 'ammunition_shotgun',price = 100},
			{name = 'ammunition_shotgun_large',price = 100},
			{name = 'ammunition_smg',price = 100},
			{name = 'ammunition_smg_large',price = 100},
			{name = 'ammunition_rifle',price = 100},
			{name = 'ammunition_rifle_large',price = 100},
			{name = 'ammunition_snp',price = 100},
			{name = 'ammunition_snp_large',price = 100},
			{name = 'ammunition_fireextinguisher',price = 100},
			{name = 'bulletproof',price = 1000},
			--{name = 'binoculars',price = 50},
			{name = 'flashlight',price = 100}
		}
	},

	BlackMarket = { -- available for Config.InventoryJob.Mafia
		Locations = {
			{ x = -1297.96, y = -392.60, z = 35.47 }
		},
		Items = {
			{name = 'WEAPON_PISTOL', price = 10000},
			{name = 'ammunition_pistol',price = 1000},
			{name = 'ammunition_pistol_large',price = 1000}
		}
	},

	LicenseShop = {
		Locations = {
	    	{x = 12.47, y = -1105.5, z = 29.8}
		}
	},

	ShopNightclub = { -- available for Config.InventoryJob.Nightclub
		Locations = {
	    	{ x = -2677.92, y = 1334.81, z = 139.88 },
	    	{ x = -1879.94, y = 2063.07, z = 134.92 }
		},
		Items = {
			{name = 'WEAPON_FLASHLIGHT', price = 1000},
			{name = 'WEAPON_KNIFE', price = 1000},
			{name = 'WEAPON_BAT', price = 1000},
			{name = 'WEAPON_PISTOL', price = 10000},
			{name = 'WEAPON_PUMPSHOTGUN',price = 10000},
			{name = 'WEAPON_SMOKEGRENADE',price = 1000},
			{name = 'WEAPON_FIREEXTINGUISHER',price = 1000},
			{name = 'WEAPON_CROWBAR',price = 1000},
			{name = 'WEAPON_BZGAS',price = 1000},
			{name = 'ammunition_pistol',price = 100},
			{name = 'ammunition_pistol_large',price = 200},
			{name = 'ammunition_shotgun',price = 100},
			{name = 'ammunition_shotgun_large',price = 200},
			{name = 'ammunition_smg',price = 100},
			{name = 'ammunition_smg_large',price = 200},
			{name = 'ammunition_rifle',price = 100},
			{name = 'ammunition_rifle_large',price = 200},
			{name = 'ammunition_snp',price = 100},
			{name = 'ammunition_snp_large',price = 200},
			{name = 'ammunition_fireextinguisher',price = 100},
			{name = 'bulletproof',price = 1000},
			--{name = 'binoculars',price = 50},
			{name = 'flashlight',price = 100}
		}
	},
}

Config.Throwables = { -- WEAPON NAME & WEAPON HASH
	weapon_dagger = 0x92A27487,
	weapon_bat = 0x958A4A8F,
	weapon_bottle = 0xF9E6AA4B,
	weapon_crowbar = 0x84BD7BFD,
	weapon_unarmed = 0xA2719263,
	weapon_flashlight = 0x8BB05FD7,
	weapon_golfclub = 0x440E4788,
	weapon_hammer = 0x4E875F73,
	weapon_hatchet = 0xF9DCBF2D,
	weapon_knuckle = 0xD8DF3C3C,
	weapon_knife = 0x99B507EA,
	weapon_machete = 0xDD5DF8D9,
	weapon_switchblade = 0xDFE37640,
	weapon_nightstick = 0x678B81B1,
	weapon_wrench = 0x19044EE0,
	weapon_battleaxe = 0xCD274149,
	weapon_poolcue = 0x94117305,
	weapon_stone_hatchet = 0x3813FC08,
	weapon_pistol = 0x1B06D571,
	weapon_pistol_mk2 = 0xBFE256D4,
	weapon_combatpistol = 0x5EF9FEC4,
	weapon_appistol = 0x22D8FE39,
	weapon_stungun = 0x3656C8C1,
	weapon_pistol50 = 0x99AEEB3B,
	weapon_snspistol = 0xBFD21232,
	weapon_snspistol_mk2 = 0x88374054,
	weapon_heavypistol = 0xD205520E,
	weapon_vintagepistol = 0x83839C4,
	weapon_flaregun = 0x47757124,
	weapon_marksmanpistol = 0xDC4DB296,
	weapon_revolver = 0xC1B3C3D1,
	weapon_revolver_mk2 = 0xCB96392F,
	weapon_doubleaction = 0x97EA20B8,
	weapon_microsmg = 0x13532244,
	weapon_smg = 0x2BE6766B,
	weapon_smg_mk2 = 0x78A97CD0,
	weapon_assaultsmg = 0xEFE7E2DF,
	weapon_combatpdw = 0xA3D4D34,
	weapon_machinepistol = 0xDB1AA450,
	weapon_minismg = 0xBD248B55,
	weapon_pumpshotgun = 0x1D073A89,
	weapon_pumpshotgun_mk2 = 0x555AF99A,
	weapon_sawnoffshotgun = 0x7846A318,
	weapon_assaultshotgun = 0xE284C527,
	weapon_bullpupshotgun = 0x9D61E50F,
	weapon_musket = 0xA89CB99E,
	weapon_heavyshotgun = 0x3AABBBAA,
	weapon_dbshotgun = 0xEF951FBB,
	weapon_autoshotgun = 0x12E82D3D,
	weapon_assaultrifle = 0xBFEFFF6D,
	weapon_assaultrifle_mk2 = 0x394F415C,
	weapon_carbinerifle = 0x83BF0278,
	weapon_carbinerifle_mk2 = 0xFAD1F1C9,
	weapon_advancedrifle = 0xAF113F99,
	weapon_specialcarbine = 0xC0A3098D,
	weapon_specialcarbine_mk2 = 0x969C3D67,
	weapon_bullpuprifle = 0x7F229F94,
	weapon_bullpuprifle_mk2 = 0x84D6FAFD,
	weapon_compactrifle = 0x624FE830,
	weapon_mg = 0x9D07F764,
	weapon_combatmg = 0x7FD62962,
	weapon_combatmg_mk2 = 0xDBBD7280,
	weapon_gusenberg = 0x61012683,
	weapon_sniperrifle = 0x5FC3C11,
	weapon_heavysniper = 0xC472FE2,
	weapon_heavysniper_mk2 = 0xA914799,
	weapon_marksmanrifle = 0xC734385A,
	weapon_marksmanrifle_mk2 = 0x6A6C02E0,
	weapon_rpg = 0xB1CA77B1,
	weapon_grenadelauncher = 0xA284510B,
	weapon_grenadelauncher_smoke = 0x4DD2DC56,
	weapon_minigun = 0x42BF8A85,
	weapon_firework = 0x7F7497E5,
	weapon_railgun = 0x6D544C99,
	weapon_hominglauncher = 0x63AB0442,
	weapon_compactlauncher = 0x0781FE4A,
	weapon_grenade = 0x93E220BD,
	weapon_bzgas = 0xA0973D5E,
	weapon_smokegrenade = 0xFDBC8A50,
	weapon_flare = 0x497FACC3,
	weapon_molotov = 0x24B17070,
	weapon_stickybomb = 0x2C3731D9,
	weapon_proxmine = 0xAB564B93,
	weapon_snowball = 0x787F0BB,
	weapon_pipebomb = 0xBA45E8B8,
	weapon_ball = 0x23C9F95C,
	weapon_petrolcan = 0x34A67B97,
	weapon_fireextinguisher = 0x60EC506,
	weapon_parachute = 0xFBAB5776
}

Config.FuelCan = 883325847

Config.PropList = { -- Here you can change the prop when using the item.
	cash = {['model'] = 'prop_cash_pile_02', ['bone'] = 28422, ['x'] = 0.02, ['y'] = 0.02, ['z'] = -0.08, ['xR'] = 270.0, ['yR'] = 180.0, ['zR'] = 0.0}
}

Config.EnableInventoryHUD = true

Config.Ammo = {
	{
		name = 'ammunition_pistol',
		weapons = {
			'WEAPON_PISTOL',
			'WEAPON_APPISTOL',
			'WEAPON_SNSPISTOL',
			'WEAPON_COMBATPISTOL',
			'WEAPON_HEAVYPISTOL',
			'WEAPON_MACHINEPISTOL',
			'WEAPON_MARKSMANPISTOL',
			'WEAPON_PISTOL50',
			'WEAPON_VINTAGEPISTOL',
			'WEAPON_REVOLVER',
		},
		count = 30
	},
	{
		name = 'ammunition_pistol_large',
		weapons = {
			'WEAPON_PISTOL',
			'WEAPON_APPISTOL',
			'WEAPON_SNSPISTOL',
			'WEAPON_COMBATPISTOL',
			'WEAPON_HEAVYPISTOL',
			'WEAPON_MACHINEPISTOL',
			'WEAPON_MARKSMANPISTOL',
			'WEAPON_PISTOL50',
			'WEAPON_VINTAGEPISTOL',
			'WEAPON_REVOLVER'
		},
		count = 60
	},
	{
		name = 'ammunition_shotgun',
		weapons = {
			'WEAPON_ASSAULTSHOTGUN',
			'WEAPON_AUTOSHOTGUN',
			'WEAPON_BULLPUPSHOTGUN',
			'WEAPON_DBSHOTGUN',
			'WEAPON_HEAVYSHOTGUN',
			'WEAPON_PUMPSHOTGUN',
			'WEAPON_SAWNOFFSHOTGUN'
		},
		count = 12
	},
	{
		name = 'ammunition_shotgun_large',
		weapons = {
			'WEAPON_ASSAULTSHOTGUN',
			'WEAPON_AUTOSHOTGUN',
			'WEAPON_BULLPUPSHOTGUN',
			'WEAPON_DBSHOTGUN',
			'WEAPON_HEAVYSHOTGUN',
			'WEAPON_PUMPSHOTGUN',
			'WEAPON_SAWNOFFSHOTGUN'
		},
		count = 18
	},
	{
		name = 'ammunition_smg',
		weapons = {
			'WEAPON_ASSAULTSMG',
			'WEAPON_MICROSMG',
			'WEAPON_MINISMG',
			'WEAPON_SMG'
		},
		count = 45
	},
	{
		name = 'ammunition_smg_large',
		weapons = {
			'WEAPON_ASSAULTSMG',
			'WEAPON_MICROSMG',
			'WEAPON_MINISMG',
			'WEAPON_SMG'
		},
		count = 65
	},
	{
		name = 'ammunition_rifle',
		weapons = {
			'WEAPON_ADVANCEDRIFLE',
			'WEAPON_ASSAULTRIFLE',
			'WEAPON_BULLPUPRIFLE',
			'WEAPON_CARBINERIFLE',
			'WEAPON_SPECIALCARBINE',
			'WEAPON_COMPACTRIFLE'
		},
		count = 45
	},
	{
		name = 'ammunition_rifle_large',
		weapons = {
			'WEAPON_ADVANCEDRIFLE',
			'WEAPON_ASSAULTRIFLE',
			'WEAPON_BULLPUPRIFLE',
			'WEAPON_CARBINERIFLE',
			'WEAPON_SPECIALCARBINE',
			'WEAPON_COMPACTRIFLE'
		},
		count = 65
	},
	{
		name = 'ammunition_snp',
		weapons = {
			'WEAPON_SNIPERRIFLE',
			'WEAPON_HEAVYSNIPER',
			'WEAPON_MARKSMANRIFLE'
		},
		count = 10
	},
	{
		name = 'ammunition_snp_large',
		weapons = {
			'WEAPON_SNIPERRIFLE',
			'WEAPON_HEAVYSNIPER',
			'WEAPON_MARKSMANRIFLE'
		},
		count = 15
	},
	{
		name = 'ammunition_fireextinguisher',
		weapons = {
			'WEAPON_FIREEXTINGUISHER'
		},
		count = 15
	}
}

Config.VaultBox = 'p_v_43_safe_s'
Config.Vault = {
	vault = {
		coords = vector3(-544.61, -197.39, 37.22),
		heading = 298.73,
		needItemLicense = 'apple', --'licence_vault' -- If you don't want to use items Allow you to leave it blank or needItemLicense = nil
		InfiniteLicense = true, -- Should one License last forever?
		show=true,
	},
	police = { -- blokkenpark kantoor
		coords = vector3(452.99, -973.48, 29.69),
		heading = 270.00,
		needItemLicense = false,
		show=true,
	},
	ambulance = {
		coords = vector3(337.54, -584.01, 27.9),
		heading = 74.52,
		needItemLicense = false,
		show=true,
	},
	mechanic = {
		coords = vector3(-201.79, -1314.48, 30.09),
		heading = 358.01,
		needItemLicense = false,
		show=true,
	},
	nightclub = {
		coords = vector3(-1496.15, 124.61, 55.67),
		heading = 229.74,
		needItemLicense = false,
		show=true,
	},
	bahamas = {
		coords = vector3(-1382.2, -610.09, 29.82),
		heading = 344.18,
		needItemLicense = false,
		show=true,
	},
	taxi = {
		coords = vector3(891.57, -173.07, 73.67),
		heading = 57.67,
		needItemLicense = false,
		show=true,
	},
	pizza = {
		coords = vector3(447.25, 140.5, 99.2),
		heading = 160.61,
		needItemLicense = false,
		show=true,
	},
	cardealer = {
		coords = vector3(-12.53, -1663.25, 32.04),
		heading = 169.96,
		needItemLicense = false,
		show=true,
	},
	starbucks = {
		coords = vector3(-632.35, 226.28, 80.88),
		heading = 86.65,
		needItemLicense = false,
		show=true,
	},
	gemeente = {
		coords = vector3(-549.06, -199.27, 69.98),
		heading = 212.86,
		needItemLicense = false,
		show=true,
	},
	pilot = {
		coords = vector3(-931.34, -2933.14, 12.95),
		heading = 327.39,
		needItemLicense = false,
		show=true,
	},
	peaky = {
		coords = vector3(1391.55,1158.81,114.33),
		heading = 270.52,
		needItemLicense = false,
		show=false,
	},
	diablo = {
		coords = vector3(-96.3,817.32,235.72),
		heading = 192.25,
		needItemLicense = false,
		show=false,
	},
	pericolo = {
		coords = vector3(-1798.63,451.42,127.29),
		heading = 0.55,
		needItemLicense = false,
		show=true,
	
	}
}
