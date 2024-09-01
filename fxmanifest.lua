fx_version 'cerulean'
game 'gta5'
author 'M4rrk'
description ' MKAC'

lua54 'yes'


server_script {
    'server/*.lua'
}

client_script {
    'client/*.lua',
}

shared_script {
    'shared/*.lua',
    '@ox_lib/init.lua'
}
