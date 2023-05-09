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
    Wait(1000 * Config.MinTransportTime * location)
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z, false, true, true, false)
    --playCutscene(true)
    DoScreenFadeIn(1000)
end

local function sortCoordsByDistance(coordsTable, playerCoords)
    table.sort(coordsTable, function(a, b)
        return #(b - playerCoords) < #(a - playerCoords)
    end)
    return coordsTable
end

RegisterNetEvent('trainstation:openMenu', function(location)
    if not Config.Stations[location] then return end
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local stationCoords = Config.Stations[location].ticketBooth
    if #(coords - stationCoords) > 5 then return end
    local organizedCoords = sortCoordsByDistance(coordsTable, coords)
    local menu = {
        {
            header = 'Train Stations',
            isMenuHeader = true
        }
    }
    for k,v in ipairs(organizedCoords) do
        for i,t in ipairs(Config.Stations) do
            if v == t.ticketBooth then
                local price = math.ceil(Config.MaxTransportPrice / k)
                menu[#menu+1] = {
                    header = v.label,
                    text = 'Price: $'..price,
                    params = {
                        isAction = true,
                        event = function(data)
                            exports[Config.Core]:TriggerCallback('trainstation:purchaseTicket', function(cb)
                                if not cb then return end
                                teleportPlayer(data.toCoords)
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
        coordsTable[k] = v.ticketBooth
        if Config.UseTarget then

        else        
            exports[Config.Core]:createPrompt('travel_prompt' ..k , v.ticketBooth, 0xF3830D8E, 'Buy Train Tickets', {
                type = 'client',
                event = 'trainstation:openMenu',
                args = k
            })
            exports[Config.Core]:CreateBlip('travel_blip' ..k, v.label, v.ticketBooth.x, v.ticketBooth.y, v.ticketBooth.z, Config.Blip.sprite, Config.Blip.scale, Config.Blip.rotation, Config.Blip.radius)
            exports[Config.Core]:SpawnPed('travel_ped' .. k, Config.PedModel, v.pedCoords.x, v.pedCoords.y, v.pedCoords.z, v.pedCoords.w)
        end
    end
end)