Config = {}

Config.Core = 'qbr-core' -- in case you rename your qbr-core folder
Config.Menu = 'qbr-menu' -- in case you rename your qbr-menu folder
Config.UseTarget = false
Config.MinTransportTime = 1 -- time in seconds to wait while loading into the next train Station
Config.MaxTransportPrice = 20 -- price in dollars to charge for going to the farthest station
Config.PedModel = 'A_M_M_ValLaborer_01'

Config.Stations = {
    [1] = {
        label = "Benedict Point",
        pedCoords = vector4(-5228.61, -3468.32, -20.57, 84.16),
        ticketBooth = vector4(-5230.11, -3468.51, -20.58, 271.99),
        dropOff = vector4(-5232.18, -3472.48, -20.55, 290.85)
    },
    [2] = {
        label = "Armadillo Station",
        pedCoords = vector4(-3729.21, -2601.35, -12.94, 184.28),
        ticketBooth = vector4(-3729.28, -2602.97, -12.94, 350.58),
        dropOff = vector4(-3746.16, -2611.66, -13.27, 294.11)
    },
    [3] = {
        label = "Blackwater Station",
        pedCoords = vector4(-875.15, -1326.81, 43.97, 27.58),
        ticketBooth = vector4(-875.15, -1325.16, 43.98, 198.41),
        dropOff = vector4(-882.04, -1328.93, 43.97, 257.11)
    },
    [4] = {
        label = "Riggs Station",
        pedCoords = vector4(-1094.22, -577.64, 82.41, 53.55),
        ticketBooth = vector4(-1095.64, -576.68, 82.41, 230.6),
        dropOff = vector4(-1100.63, -577.41, 82.4, 318.78)
    },
    [5] = {
        label = "Strawberry Station",
        pedCoords = vector4(-1766.02, -380.41, 157.73, 144.97),
        ticketBooth = vector4(-1767.16, -381.6, 157.73, 324.16),
        dropOff = vector4(-1767.79, -387.94, 157.72, 328.08)
    },
    [6] = {
        label = "Wallace Station",
        pedCoords = vector4(-1300.43, 400.23, 95.45, 168.01),
        ticketBooth = vector4(-1301.16, 398.65, 95.43, 331.14),
        dropOff = vector4(-1309.75, 398.32, 95.38, 243.74)
    },
    [7] = {
        label = "Valentine Station",
        pedCoords = vector4(-175.36, 631.91, 114.09, 323.63),
        ticketBooth = vector4(-174.21, 633.22, 114.09, 175.97),
        dropOff = vector4(-165.41, 630.41, 114.03, 54.95)
    },
    [8] = {
        label = "Rhodes Station",
        pedCoords = vector4(1230.14, -1298.57, 76.9, 238.62),
        ticketBooth = vector4(1231.34, -1299.79, 76.9, 33.54),
        dropOff = vector4(1225.96, -1306.69, 76.9, 332.05)
    },
    [9] = {
        label = "Emerald Station",
        pedCoords = vector4(1230.14, -1298.57, 76.9, 238.62),
        ticketBooth = vector4(1525.24, 442.59, 90.68, 108.2),
        dropOff = vector4(1526.87, 431.48, 90.68, 92.16)
    },
    [10] = {
        label = "Saint Denis Station",
        pedCoords = vector4(2748.01, -1396.42, 46.18, 26.42),
        ticketBooth = vector4(2747.25, -1394.95, 46.18, 215.27),
        dropOff = vector4(2742.08, -1406.52, 46.19, 13.3)
    },
    [11] = {
        label = "Van Horn Station",
        pedCoords = vector4(2987.16, 574.63, 44.62, 9.79),
        ticketBooth = vector4(2987.53, 576.18, 44.62, 160.59),
        dropOff = vector4(2890.98, 619.64, 57.72, 264.72)
    },
    [12] = {
        label = "Annesburg Station",
        pedCoords = vector4(2933.02, 1282.25, 44.65, 69.65),
        ticketBooth = vector4(2931.64, 1283.18, 44.65, 254.4),
        dropOff = vector4(2944.89, 1269.4, 44.66, 74.03)
    }
}