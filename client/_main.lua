local coordsTable = {}

local function playCutscene(bool)
    CreateThread(function()
        if bool then SendNuiMessage({action = 'hide'}) return end
        SendNuiMessage({action = 'play'})
    end)
end

local function teleportPlayer(coords, location)
    DoScreenFadeOut(1000)
    --playCutscene()
    location = #coordsTable - location
    Wait(1000 * Config.MinTransportTime * location)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, true, true, false)
    --playCutscene(true)
    DoScreenFadeIn(1000)
end

local function sortCoordsByDistance(coordsTable, playerCoords)
    if type(playerCoords) == 'vector4' then playerCoords = vec3(playerCoords.x, playerCoords.y, playerCoords.z) end
    table.sort(coordsTable, function(a, b)
        if type(b) == 'vector4' then b = vec3(b.x, b.y, b.z) end
        if type(a) == 'vector4' then a = vec3(a.x, a.y, a.z) end
        return #(b - playerCoords) < #(a - playerCoords)
    end)
    return coordsTable
end

RegisterNetEvent('trainstation:openMenu', function(location)
    if not Config.Stations[location] then return end
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local stationCoords = Config.Stations[location].ticketBooth
    if #(coords - vec3(stationCoords.x, stationCoords.y, stationCoords.z)) > 5 then return end
    local organizedCoords = sortCoordsByDistance(coordsTable, coords)
    local menu = {
        {
            header = 'Train Stations',
            isMenuHeader = true
        }
    }
    for k,v in ipairs(organizedCoords) do
        for i,t in ipairs(Config.Stations) do
            if v == t.ticketBooth and i ~= location then
                local price = math.ceil(Config.MaxTransportPrice / k)
                menu[#menu+1] = {
                    header = t.label,
                    text = 'Price: $'..price,
                    params = {
                        isAction = true,
                        event = function(data)
                            exports[Config.Core]:TriggerCallback('trainstation:purchaseTicket', function(cb)
                                if not cb then return end
                                teleportPlayer(data.toCoords, data.location)
                            end, data)
                        end,
                        args = {
                            location = k,
                            currentCoords = stationCoords,
                            toCoords = t.dropOff
                        }
                    }
                }
            end
        end
    end
    exports[Config.Menu]:openMenu(menu)
end)


CreateThread(function()
    for k, v in pairs(Config.Stations) do
        if Config.UseTarget then

        else
            exports[Config.Core]:createPrompt('travel_prompt'.. k, vector3(v.ticketBooth.x, v.ticketBooth.y, v.ticketBooth.z), 0xF3830D8E, 'Buy Train Tickets', {
                type = 'client',
                event = 'trainstation:openMenu',
                args = {k}
            })
        end
        exports[Config.Core]:CreateBlip('travel_blip'.. k, v.label, v.ticketBooth.x, v.ticketBooth.y, v.ticketBooth.z, -250506368, 0.5)
        exports[Config.Core]:SpawnPed('travel_ped'.. k, Config.PedModel, v.pedCoords.x, v.pedCoords.y, v.pedCoords.z, v.pedCoords.w)
        coordsTable[k] = v.ticketBooth
    end
end)

AddEventHandler("onResourceStop", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    for k, v in pairs(Config.Stations) do
        exports[Config.Core]:DeleteBlip('travel_blip'.. k)
        exports[Config.Core]:RemovePed('travel_ped'.. k)
    end
end)