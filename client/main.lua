ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('armour')
AddEventHandler('armour', function()
local playerPed = PlayerPedId()
SetPedArmour(playerPed, 100)
end)

RegisterNetEvent('Removearmour')
AddEventHandler('Removearmour', function ()
    local PlayerPed = PlayerPedId()
    SetPedArmour(PlayerPed, 0)
end)

RegisterNetEvent('Kill')
AddEventHandler('Kill', function ()
    local PlayerPed = PlayerPedId()
    SetEntityHealth(PlayerPed, 0)
end)

RegisterNetEvent('Revive')
AddEventHandler('Revive', function ()
    local PlayerPed = PlayerPedId()
    SetEntityHealth(PlayerPed, 100)
    if Config.esx_ambulancejob == true then
        TriggerEvent('esx_ambulancejob:revive')
        else
        TriggerEvent('ars_ambulancejob:healPlayer', {revive = true})
    end
end)

RegisterNetEvent('Freeze')
AddEventHandler('Freeze', function ()
    local PlayerPed = PlayerPedId()
    FreezeEntityPosition(PlayerPed,true)
end)

RegisterNetEvent('UnFreeze')
AddEventHandler('UnFreeze', function ()
    local PlayerPed = PlayerPedId()
    FreezeEntityPosition(PlayerPed,false)
end)

RegisterNetEvent('Heal')
AddEventHandler('Heal', function ()
    local PlayerPed = PlayerPedId()
    SetEntityHealth(PlayerPed, 200)
    TriggerEvent('esx_basicneeds:healPlayer')
end)

RegisterNetEvent('RepairVeh')
AddEventHandler('RepairVeh', function ()
	local ped = PlayerPedId()
	local plyVeh = GetVehiclePedIsIn(ped, false)
	SetVehicleFixed(plyVeh)
	SetVehicleDirtLevel(plyVeh, 0.0)
end)