

ESX.RegisterServerCallback(GetCurrentResourceName() ..':getStartData', function(source, cb) while not robbery.ready do Citizen.Wait(0); end cb( (robbery.cops or 0) ); end)

robbery = robbery or {}



robbery.doLock = {}

robbery.__VERSION = "1.02"

robbery.lootOffsets = (robbery.lootOffsets or { 

  ['entertainment unit'] = vector3(-8.29,16.00,0.79), 

  ['drawers'] = vector3(-7.21,9.16,0.79), 

  ['bookshelf'] = vector3(-1.2,16.99,1.2), 

  ['chest'] = vector3(5.4,13.71,0.79), 

  ['wardrobe'] = vector3(4.5,18.91,0.79), 

  ['bedside table'] = vector3(2.73,17.63,0.79), 

  ['bathroom cabinet'] = vector3(0.83,18.41,0.79), 

})  



robbery.dogOffset = vector3(-3.5, 0.0, -0.5) 

robbery.pedOffset = vector3(3.15, 16.88, -0.2)  



if type(MySQL == "table") then

  MySQL.ready(function(...) robbery.sqlReady = true; end)

end



function GetDatabaseName()

  local dbconvar = GetConvar('mysql_connection_string', 'Empty')



  if not dbconvar or dbconvar == "Empty" then 

    error("Local dbconvar is empty."); 

    return false

  else

    local strStart,strEnd = string.find(dbconvar, "database=")

    if not strStart or not strEnd then

      local oStart,oEnd = string.find(dbconvar,"mysql://")

      if not oStart or not oEnd then

        error("Incorrect mysql_connection_string.")

        return false

      else

        local hostStart,hostEnd = string.find(dbconvar,"@",oEnd)

        local dbStart,dbEnd = string.find(dbconvar,"/",hostEnd+1)

        local eStart,eEnd = string.find(dbconvar,"?")

        local _end = (eEnd and eEnd-1 or dbconvar:len())

        local dbName = string.sub(dbconvar, dbEnd + 1, _end) 

        return dbName

      end

    else

      local dbStart,dbEnd = string.find(dbconvar,";",strEnd)

      local dbName = string.sub(dbconvar, strEnd + 1, (dbEnd and dbEnd-1 or dbconvar:len())) 

      return dbName

    end    

  end

end



robbery.awake = function()  

  robbery.houseData = {}  

  for k,v in pairs(Config.Entrys) do 

    math.randomseed(math.floor(os.time() * math.pi * math.random(500,1000)))

    local diff = math.random(2,6)  

    robbery.houseData[v] = { 

      entry = v, 

      difficulty = diff, 

      locked = (diff >= 2 and true or false), 

      spawnPed = (diff >= 2 and true or false), 

      spawnDog = (diff >= 4 and Config.UseDog and true or false),  

      loot = robbery.generateLoot(v), 

    }  

  end 



  while not robbery.sqlReady do Wait(0); end

  while not MySQL.Async or not MySQL.Async.fetchAll do Wait(0); end



  

  local dbName = GetDatabaseName()



  if not dbName then

    error("Error connecting to database.")

    return

  end



  local dbTable = "items"

  MySQL.Async.fetchAll("SELECT * FROM INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA=@dbName AND TABLE_NAME=@tabName",{['@dbName'] = dbName,['@tabName'] = dbTable},function(retData)

    if retData and retData[1] then  

      MySQL.Async.fetchAll('SELECT * FROM items',{},function(retData)

        robbery.itemCache = {}

        if retData and type(retData) == "table" and retData[1] then

          for k,v in pairs(retData) do

            if v and v.name then

              robbery.itemCache[v.name] = true

            end

          end

        end

        robbery.ready = true  

        robbery.update() 

      end)

    else

      print(GetCurrentResourceName().." does not have required SQL tables.")

    end

  end)

end  



robbery.update = function()

  while true do

    Wait(1000)

    robbery.houseLocker()

  end

end



robbery.generateLoot = function(pos) 

  local loot = {} 

  for k,v in pairs(robbery.lootOffsets) do 

    loot[v] = {tab = k, looted = false}  

  end 

  return loot 

end  



robbery.getHouseData = function(source,cb,pos) 

  while not robbery.ready do Wait(0); end 

  cb(robbery.houseData[pos])  

end  



robbery.tryLoot = function(source,cb,entry,pos) 

  local val = robbery.houseData[entry].loot[pos].looted 

  if not val then 

    robbery.houseData[entry].loot[pos].looted = true 

  end 

  cb(val) 

end  



robbery.looted = function(tab,diff) 

  local _source = source 

  local loot = robbery.lootTable[tab] 

  if not ESX then return; end

  local xPlayer = ESX.GetPlayerFromId(_source)

  while not xPlayer do xPlayer = ESX.GetPlayerFromId(_source); Wait(10); end 

  local loot_cache = {}

  if loot.item and loot.money and loot.weapons then

    for k,v in pairs(loot.item) do

      local chance = math.random(0,100) 

      if chance <= v.chance then 

        local amount = math.ceil(math.random(1,v.max)) 

        if robbery.itemCache and robbery.itemCache[k] then

          xPlayer.addInventoryItem(k,amount)

          table.insert(loot_cache,{

            type  = "item",

            name  = k,

            count = amount

          })

        end

      end

    end



    for k,v in pairs(loot.weapons) do

      local chance = math.random(0,100) 

      if chance <= v.chance then

        local ammo = math.random(1,v.ammo)     

        xPlayer.addWeapon(k,ammo)

        table.insert(loot_cache,{

          type  = "weapon",

          name  = k,

          count = ammo

        })

      end

    end



    if loot.money > 0 then

      local accounts = xPlayer.getAccounts()

      local hasAccount = false

      for k,v in pairs(accounts) do 

        if Config.RewardAccount and v.name == Config.RewardAccount then

          hasAccount = true

        end

      end

      if hasAccount then

        local cash = math.ceil(math.random(1,loot.money))

        if cash > 0 then

          xPlayer.addAccountMoney(Config.RewardAccount,cash)

          table.insert(loot_cache,{

            type  = "money",

            name  = (Config and Config.RewardAccount or "unknown account?"),

            count = cash

          })

        end

      else

        print(GetCurrentResourceName().." Error: Set the RewardAccount in the config.lua correctly. Cannot access account "..Config.RewardAccount)

      end

    end

  else

    for k,v in pairs(loot) do 

      local chance = math.random(0,100) 

      if chance <= v.chance then 

        local amount = math.ceil(math.random(1,v.max)) 

        if robbery.itemCache and robbery.itemCache[k] then

          xPlayer.addInventoryItem(k,amount) 

          table.insert(loot_cache,{

            type  = "item",

            name  = k,

            count = amount

          })

        end

      end 

    end

  end 

  TriggerEvent("robbery:loot_complete",_source,loot_cache)

end  



robbery.unlockHouse = function(pos) 

  robbery.houseData[pos].locked = false 

  robbery.doLock[pos] = GetGameTimer()

end  



robbery.alert = function(pos) 

  TriggerClientEvent('robbery:alertPolice', -1, pos) 

end    



robbery.houseReset = function(...)    

  for key,v in pairs(robbery.houseData) do     

    local diff = math.random(2,6)     

    robbery.houseData[key].difficulty = diff     

    robbery.houseData[key].spawnDog = (diff >= 4 and true or false)     

    robbery.houseData[key].spawnPed = (diff >= 2 and true or false)     

    robbery.houseData[key].locked = true     

    for k,v in pairs(v.loot) do       

      robbery.houseData[key].loot[k].looted = false     

    end    

  end  

end  



robbery.leave = function(pos) 

  local data = robbery.houseData[pos] 

  if data.spawnDog then 

    math.randomseed(os.time())

    local rand = math.random(100)

    if Config.DogSpawnChance and Config.DogSpawnChance >= rand then

      robbery.houseData[pos].spawnDog = false 

      local spawnPos = pos.xyz - robbery.dogOffset 

      TriggerClientEvent('robbery:spawnDog',source,spawnPos) 

    end

  end 

end  





robbery.getPed = function(source,cb,house,pos) 

  local data = robbery.houseData[house] 

  if data.spawnPed then 

    cb(true,vector3(pos.x + robbery.pedOffset.x, pos.y + robbery.pedOffset.y, pos.z + robbery.pedOffset.z)) 

  else 

    cb(false) 

  end 

end  



robbery.pedAttack = function(house,pos) 

  local _source = source  

  if not robbery.houseData[house].spawnPed then return; end 

  robbery.houseData[house].spawnPed = false 

  TriggerClientEvent('robbery:delPed',-1,house) 

  Wait(30) 

  local nP = vector3(pos.x + robbery.pedOffset.x, pos.y + robbery.pedOffset.y, pos.z + robbery.pedOffset.z) 

  robbery.alert(house) 

  TriggerClientEvent('robbery:pedAttacked',_source,nP) 

end  



local cops = {}

robbery.plyConnect = function(source,xPlayer)

  local job = (xPlayer and xPlayer.job and xPlayer.job.name)

  if job == Config.PoliceJob then

    robbery.addCop(source)

  end

end



plyDropped = function(reason) 

  local _source = source 

  if not ESX then return; end

  if cops[_source] then

    robbery.removeCop(_source)

  end

end 



robbery.addCop = function(s) 

  local _source = (s or source)

  robbery.cops = (robbery.cops or 0) + 1 

  TriggerClientEvent('robbery:setCops', -1, robbery.cops) 

  cops[_source] = true

end 



robbery.removeCop = function(s) 

  local _source = (s or source)

  robbery.cops = math.max(0, (robbery.cops or 0) - 1) 

  TriggerClientEvent('robbery:setCops', -1, robbery.cops) 

  cops[_source] = false

end 



robbery.houseLocker = function()

  local delTab = {}

  local time = GetGameTimer()

  for key,val in pairs(robbery.doLock) do

    if (time - val) > (Config.ResetAfterMinutes * 60 * 1000) then

      local diff = math.random(2,6)     

      robbery.houseData[key].difficulty = diff     

      robbery.houseData[key].spawnDog = (diff >= 4 and true or false)     

      robbery.houseData[key].spawnPed = (diff >= 2 and true or false)     

      robbery.houseData[key].locked = true     

      for k,v in pairs(robbery.houseData[key].loot) do       

        robbery.houseData[key].loot[k].looted = false     

      end 

      delTab[key] = true 

    end

  end

  for k,v in pairs(delTab) do robbery.doLock[k] = nil; end

end



robbery.takeLockpick = function()

  local _source = source

  local xPlayer

  if not ESX then return; end

  while not xPlayer do xPlayer = ESX.GetPlayerFromId(_source); Wait(0); end

  local i = xPlayer.getInventoryItem(Config.LockpickItemName)

  if i and type(i) == "table" and i.count and i.count > 0 then

    if Config.LockpickItemName and robbery.itemCache[Config.LockpickItemName] then

      xPlayer.removeInventoryItem(Config.LockpickItemName,1)

    end

  end

end



AddEventHandler('esx:playerLoaded', robbery.plyConnect) 

AddEventHandler('playerDropped', robbery.plyDropped) 

RegisterNetEvent('robbery:addCop') 

AddEventHandler('robbery:addCop', robbery.addCop) 

RegisterNetEvent('robbery:removeCop') 

AddEventHandler('robbery:removeCop', robbery.removeCop)  

RegisterNetEvent('robbery:alert') 

AddEventHandler('robbery:alert', robbery.alert)  

RegisterNetEvent('robbery:pedAttack') 

AddEventHandler('robbery:pedAttack', robbery.pedAttack)  

RegisterNetEvent('robbery:leave') 

AddEventHandler('robbery:leave', robbery.leave)  

RegisterNetEvent('robbery:unlockHouse') 

AddEventHandler('robbery:unlockHouse', robbery.unlockHouse)

RegisterNetEvent('robbery:looted') 

AddEventHandler('robbery:looted', robbery.looted)  

RegisterNetEvent('robbery:takeLockpick') 

AddEventHandler('robbery:takeLockpick', robbery.takeLockpick)  



if ESX and type(ESX) == "table" and ESX.RegisterServerCallback then

  ESX.RegisterServerCallback('robbery:getHouseData', robbery.getHouseData) 

  ESX.RegisterServerCallback('robbery:getPed', robbery.getPed) 

  ESX.RegisterServerCallback('robbery:tryLoot', robbery.tryLoot)  

end



Citizen.CreateThread(robbery.awake)