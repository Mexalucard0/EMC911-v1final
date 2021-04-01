-- Fetch Car Dealer Core Data:

ESX.RegisterServerCallback("fivem_vehicleshop:FetchCategories", function(source, cb)
    local categories = {}
    MySQL.Async.fetchAll('SELECT * FROM vehicle_categories',{},function(results)
        for k,v in pairs(results) do
            table.insert(categories,{name = v.name, label = v.label})
        end
        cb(categories)
    end)
end)
