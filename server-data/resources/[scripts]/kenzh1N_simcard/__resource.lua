resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Prefecture'

version '1.0.1'

server_scripts {
  '@es_extended/locale.lua',
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'kenzh1N_simcard_server/main.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'config.lua',
  'kenzh1N_simcard_client/main.lua'
}

dependencies {
  'instance'
}