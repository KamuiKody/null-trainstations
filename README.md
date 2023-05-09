# NULL-TRAINSTATIONS

Fast Travel Resource for qbr-core

## Description

Utilizes the train stations in county for fast traveling purposes.

## Getting Started

### Dependencies

* Must have a version of qbr-core that has the CreateBlip and CreatePed exports

alternately you can add the exports to your qbr-core on the client side with this:
```lua
QBCore.Blips = {}
QBCore.Peds = {}

exports('CreateBlip', function(name, label, x, y, z, sprite, scale, rotation, radius)
    if type(sprite) == 'string' then sprite = GetHashKey(sprite) end
    if radius then
        QBCore.Blips[name] = Citizen.InvokeNative(0x45F13B7E0A15C880, 1664425300, x, y, z, radius)
    else
        QBCore.Blips[name] = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, x, y, z)
    end
    if label then Citizen.InvokeNative(0x9CB1A1623062F402, QBCore.Blips[name], label) end
    if sprite then SetBlipSprite(QBCore.Blips[name], sprite) end
    if scale then SetBlipScale(QBCore.Blips[name], scale) end
    if rotation then SetBlipRotation(QBCore.Blips[name], rotation) end
end)

exports('DeleteBlip', function(name)
    RemoveBlip(QBCore.Blips[name])
end)

exports('SpawnPed', function(name, model, x, y, z, w)
    if type(model) == 'string' then model = GetHashKey(model) end
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(50) end
    QBCore.Peds[name] = CreatePed(model, x, y, z, w, true, true, 0, 0)
    while not DoesEntityExist(QBCore.Peds[name]) do Wait(50) end
    Citizen.InvokeNative(0x283978A15512B2FE, QBCore.Peds[name], true)
    FreezeEntityPosition(QBCore.Peds[name], true)
    SetEntityInvincible(QBCore.Peds[name], true)
    SetBlockingOfNonTemporaryEvents(QBCore.Peds[name], true)
    SetEntityCanBeDamagedByRelationshipGroup(QBCore.Peds[name], false, `PLAYER`)
    --Citizen.InvokeNative(0xFD6943B6DF77E449, QBCore.Peds[name], false)
    SetEntityAsMissionEntity(QBCore.Peds[name], true, true)
end)

exports('RemovePed', function(name)
    DeletePed(QBCore.Peds[name])
    QBCore.Peds[name] = nil
end)
```

Then add this to the bottom of server/debug.lua:
```lua
CreateThread(function()
    SetConvar('Core', GetCurrentResourceName())
    SetConvarReplicated('Core', GetCurrentResourceName())
end)
```

* Also uses qbr-menu

### Installing

* Drag It, Drop It, Config it!

## Help

Because of the simplicity of this resource and the free open source nature I am going to refrain from offering support on this project besides through issues and PR's.
