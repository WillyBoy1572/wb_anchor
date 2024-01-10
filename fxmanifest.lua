
fx_version   'cerulean'
use_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

name         'wb_anchor'
author       'WillyBoy'
version      '1.0.0'
repository   'https://github.com/WillyBoy1572/WB_Anchor'

dependencies {
	'/onesync',
}

shared_scripts {
	'init.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}
