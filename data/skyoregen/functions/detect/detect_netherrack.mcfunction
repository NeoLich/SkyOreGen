#Checks around generator frame for lava, blue ice, soul soil, and basalt; then checks what basalt are valid generators
#Called from detect:gen_type

execute at @e[type=minecraft:item_frame, tag=b_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:netherrack",Count:1b,tag:{netherrack_generator:1b}}}] run summon minecraft:leash_knot ~ ~ ~ {Tags:["temp_netherrack"]}
execute at @e[type=minecraft:leash_knot, tag=temp_netherrack] run summon minecraft:area_effect_cloud ~-4 ~-4 ~-4 {Tags:["netherracks"], NoGravity: 1}
execute at @e[type=leash_knot, tag=temp_netherrack] if entity @e[type=item_frame, distance=..4] run kill @e[type=leash_knot, tag = temp_netherrack]
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~8 ~ ~ {Tags:["netherrackswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~1 ~ ~ {Tags:["netherracks"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~2 ~ ~ {Tags:["netherracks"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~4 ~ ~ {Tags:["netherracks"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherrackswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=netherrackswait, limit=1] Tags set value ["netherracks"]
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~ ~ ~8 {Tags:["netherrackswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~ ~ ~1 {Tags:["netherracks"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~ ~ ~2 {Tags:["netherracks"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~ ~ ~4 {Tags:["netherracks"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherrackswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=netherrackswait, limit=1] Tags set value ["netherracks"]
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~ ~8 ~ {Tags:["netherrackswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~ ~1 ~ {Tags:["netherracks"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~ ~2 ~ {Tags:["netherracks"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherracks] run summon minecraft:area_effect_cloud ~ ~4 ~ {Tags:["netherracks"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherrackswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=netherrackswait, limit=1] Tags set value ["netherracks"]
execute as @e[type=minecraft:area_effect_cloud, tag=netherracks] at @s if block ~ ~ ~ minecraft:lava run data modify entity @s Tags set value ["lava_netherrack","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=netherracks] at @s if block ~ ~ ~ minecraft:soul_soil run data modify entity @s Tags set value ["soul_netherrack","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=netherracks] at @s if block ~ ~ ~ minecraft:blue_ice run data modify entity @s Tags set value ["ice_netherrack","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=netherracks] at @s if block ~ ~ ~ minecraft:basalt run data modify entity @s Tags set value ["basalt_netherrack","bas_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=netherracks]
execute as @e[type=minecraft:area_effect_cloud, tag=basalt_netherrack] at @s if entity @e[type=minecraft:area_effect_cloud, tag=lava_netherrack, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=soul_netherrack, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=ice_netherrack, distance=..1.1] run data modify entity @s Tags set value ["valid","netherrack","temp","bas_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=basalt_netherrack]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=netherrack, tag=temp] run tellraw @a ["",{"text":"[Netherrack Generator]","color":"red"},{"text":" Found valid generator"}]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=netherrack, tag=temp] at @s run tag @s remove temp
