#Checks around generator frame for water, lava, and cobblestone; then checks what cobblestone are valid generators
#Called from detect:gen_type

execute at @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:copper_block",Count:1b,tag:{copper_generator:1b}}}] run summon minecraft:leash_knot ~ ~ ~ {Tags:["temp_copper"]}
execute at @e[type=minecraft:leash_knot, tag=temp_copper] run summon minecraft:area_effect_cloud ~-4 ~-4 ~-4 {Tags:["coppers"], NoGravity: 1}
execute at @e[type=leash_knot, tag=temp_copper] if entity @e[type=item_frame, distance=..4] run kill @e[type=leash_knot, tag = temp_copper]
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~8 ~ ~ {Tags:["copperswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~1 ~ ~ {Tags:["coppers"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~2 ~ ~ {Tags:["coppers"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~4 ~ ~ {Tags:["coppers"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=copperswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=copperswait, limit=1] Tags set value ["coppers"]
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~ ~ ~8 {Tags:["copperswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~ ~ ~1 {Tags:["coppers"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~ ~ ~2 {Tags:["coppers"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~ ~ ~4 {Tags:["coppers"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=copperswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=copperswait, limit=1] Tags set value ["coppers"]
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~ ~8 ~ {Tags:["copperswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~ ~1 ~ {Tags:["coppers"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~ ~2 ~ {Tags:["coppers"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coppers] run summon minecraft:area_effect_cloud ~ ~4 ~ {Tags:["coppers"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=copperswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=copperswait, limit=1] Tags set value ["coppers"]
execute as @e[type=minecraft:area_effect_cloud, tag=coppers] at @s if block ~ ~ ~ minecraft:lava run data modify entity @s Tags set value ["lava_copper","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=coppers] at @s if block ~ ~ ~ minecraft:water run data modify entity @s Tags set value ["water_copper","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=coppers] at @s if block ~ ~ ~ #minecraft:stairs[waterlogged=true] run data modify entity @s Tags set value ["water_copper","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=coppers] at @s if block ~ ~ ~ #minecraft:trapdoors[waterlogged=true] run data modify entity @s Tags set value ["water_copper","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=coppers] at @s if block ~ ~ ~ #minecraft:slabs[waterlogged=true] run data modify entity @s Tags set value ["water_copper","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=coppers] at @s if block ~ ~ ~ minecraft:cobblestone run data modify entity @s Tags set value ["cobble_copper","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=coppers]
execute as @e[type=minecraft:area_effect_cloud, tag=cobble_copper] at @s if entity @e[type=minecraft:area_effect_cloud, tag=water_copper, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=lava_copper, distance=..1.1] run data modify entity @s Tags set value ["valid","copper","temp","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=cobble_copper]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=copper, tag=temp] run tellraw @a ["",{"text":"[Copper Generator]","color":"green"},{"text":" Found valid generator"}]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=copper, tag=temp] at @s run tag @s remove temp
