function GetDisplayCarData()
    ESX.TriggerServerCallback("fivem_vehicleshop:FetchDisplayCarData", function(data)
        display = nil
        Wait(0)
        display = data
        end)
end

