exports[Config.Core]:CreateCallback('trainstation:purchaseTicket', function(source, cb, data)
    local price = math.ceil(Config.MaxTransportPrice /data.location)
    local Player = exports[Config.Core]:GetPlayer(source)
    if not Player.Functions.RemoveMoney('cash', price, 'Train Ride.') then
        if not Player.Functions.RemoveMoney('bank', price, 'Train Ride.') then cb(false) return end
    end
    cb(true)
end)