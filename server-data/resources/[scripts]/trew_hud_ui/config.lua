--[[
Descripttion: 
version: 
Author: Shaolada
Date: 2021-03-08 14:36:57
LastEditors: Shaolada
LastEditTime: 2021-03-13 23:00:49
--]]
Config = {}

Config.Locale = 'en'

Config.serverLogo = 'https://i.imgur.com/AcgDL9f.png'

Config.font = {
	name 	= 'Montserrat',
	url 	= 'https://fonts.googleapis.com/css?family=Montserrat:300,400,700,900&display=swap'
}


Config.voice = {

	levels = {
		default = 5.0,
		shout = 10.0,
		whisper = 2.0,
		current = 0
	},
	
	keys = {
		distance 	= 'F2',
	}
}


Config.vehicle = {
	speedUnit = 'MPH',
	maxSpeed = 400,

	keys = {
		seatbelt 	= 'K',
		cruiser		= 'CAPS',
		signalLeft	= 'LEFT',
		signalRight	= 'RIGHT',
		signalBoth	= 'DOWN',
	}
}

Config.ui = {
	showServerLogo		= false,

	showJob		 		= true,

	showWalletMoney 	= true,
	showBankMoney 		= true,
	showBlackMoney 		= false,
	showSocietyMoney	= false,

	showLocation 		= false,
	showVoice	 		= false,

	showHealth			= true,
	showArmor	 		= true,
	showStamina	 		= false,
	showHunger 			= true,
	showThirst	 		= true,

	showMinimap			= true,

	showWeapons			= true,	
}