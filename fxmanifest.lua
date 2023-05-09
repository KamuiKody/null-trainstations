fx_version 'cerulean'
game 'rdr3'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name 'null-trainstation'
author 'Kamui Kody'
description 'A simple for fast traveling between train stations.   "Created Using Kamui Kody\'s Boilerplate"'

shared_scripts {
    "config.lua"
}

client_scripts {
    "client/*.lua"
}

server_scripts {
    "server/*.lua"
}

dependency 'qbr-core'
