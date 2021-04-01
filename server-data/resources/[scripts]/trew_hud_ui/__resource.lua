--[[
Descripttion: 
version: 
Author: Shaolada
Date: 2021-03-08 14:36:57
LastEditors: Shaolada
LastEditTime: 2021-03-08 14:53:10
--]]
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Trew HUD UI'

ui_page 'html/ui.html'


files {
	'html/ui.html',
	'html/main.css',
	'html/yef5tnm.css',
	'html/app.js',

	'html/img/*.png',
	'html/img/weapons/*.png',
	'html/sounds/*.ogg',
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/en.lua',
	'config.lua',
	'client/client.lua',
	'client/hansolo.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	'locales/br.lua',
	'locales/en.lua',
	'config.lua',
	'server/server.lua',
	'server/milleniumfalcon.lua'
}

dependencies {
	'es_extended'
}