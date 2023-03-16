-- Made by distritic
-- Do not sell, redistribute or claim this code as your own without my permission, thank you. <3
fx_version 'cerulean'
game 'gta5'


ui_page "ui/index.html"

files {
    "ui/index.html",
    "ui/vue.min.js",
    "ui/script.js",
    "ui/main.css",
    "ui/styles/police.css",
    "ui/badges/police.png",
    "ui/footer.png",
    "ui/mugshot.png"
}

shared_script '@es_extended/imports.lua'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/*.lua',
    "sv_mdt.lua",
    "sv_vehcolors.lua"
}

client_scripts {
    'client/*.lua',
    "cl_mdt.lua"
}
