fx_version 'adamant'
games { 'rdr3', 'gta5' }

mod 'robbery'
version '1.0.0'

client_scripts {
  'config.lua',
  'src/utils.lua',
  'src/client/main.lua',
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'config.lua',
  'credentials.lua',
  'src/utils.lua',
  'src/server/main.lua',
}

dependencies {
  'es_extended',
  'cron',
  'mythic_interiors',
  'lockpicking',
  'meta_libs',
  'esx_inventoryhud',
}