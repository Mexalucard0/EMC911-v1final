Config = {}
Config.InvulTime = 5 --Time in seconds after the disconnect the boat won't take damage

Config.Trailers = {

    {  
        model = 'seadoohauler',                                                         --model name
        boats = {'seadoogti215'},                                                       --models that can attach
        Position = vector3(0.0, -0.25, 0.2),                                            --offset point for attachment
        HeightOffset = 0.225,                                                           --offset point for bottom of boat to trailer
        DetachPoints = {vector3(0.7, 1.8, -0.4), vector3(-0.7, 1.8, -0.4)},             --external detach points
    },
    {  
        model = 'code3trailer',                                                         --model name
        boats = {'code3boat'},                                                       --models that can attach
        Position = vector3(0.0, 0.0, 0.2),                                            --offset point for attachment
        HeightOffset = 0.0,                                                           --offset point for bottom of boat to trailer
        DetachPoints = {vector3(1.0, 1.8, -0.4), vector3(1.0, 1.8, -0.4)},             --external detach points
    },
    {  
        model = 'yftrailer',
        boats = {'42ftyellowfin'},
        Position = vector3(0.0, -0.225, 0.2),
        HeightOffset = 1.5,
        DetachPoints = {vector3(1.0, 5.75, -0.4), vector3(-1.0, 5.75, -0.4)},
    },
    {  
        model = 'sstrailer',
        boats = {'speedster200'},
        Position = vector3(0.0, -0.32, 0.2),
        HeightOffset = 0.575,
        DetachPoints = {vector3(1.0, 1.8, -0.4), vector3(-1.0, 1.8, -0.4)},
    },
    {  
        model = 'ptrailer',
        boats = {'tritoon'},
        Position = vector3(0.0, -0.80, 0.2),
        HeightOffset = 0.88,
        DetachPoints = {vector3(1.0, 1.8, -0.4), vector3(-1.0, 1.8, -0.4)},
    },
    {  
        model = 'btrailer',
        boats = {'wildcat'},
        Position = vector3(0.0, 0.5, 00.0),
        HeightOffset = 0.0,
        DetachPoints = {vector3(1.0, 1.8, -0.4), vector3(-1.0, 1.8, -0.4)},
    },
}

AddTextEntry('BOAT_E_DETATCH', 'Press ~INPUT_CONTEXT~ to detach the watercraft')        -- Text for external detach point
AddTextEntry('BOAT_I_THING', 'Press ~INPUT_CONTEXT~ to attach/detach the watercraft')   -- Text for in boat attach/detach