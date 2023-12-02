schedule clear skyoregen:loop

kill @e[type=minecraft:area_effect_cloud, tag=cob_gen]
kill @e[type=minecraft:area_effect_cloud, tag=bas_gen]
kill @e[type=minecraft:area_effect_cloud, tag=c_saved]
kill @e[type=minecraft:area_effect_cloud, tag=b_saved]

function skyoregen:summon/kill_greg
function skyoregen:summon/kill_ned

scoreboard objectives remove sky_greg
scoreboard objectives remove sky_ned
scoreboard objectives remove sky_level
scoreboard objectives remove SkyOreGen
