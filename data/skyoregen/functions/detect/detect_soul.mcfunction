#Checks around generator frame for lava, blue ice, soul soil, and basalt; then checks what basalt are valid generators
#Called from detect:gen_type

execute at @e[type=minecraft:item_frame, tag=b_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:soul_soil",Count:1b,tag:{soul_generator:1b}}}] run summon minecraft:leash_knot ~ ~ ~ {Tags:["temp_soul"]}
execute at @e[type=minecraft:leash_knot, tag=temp_soul] run summon minecraft:area_effect_cloud ~-4 ~-4 ~-4 {Tags:["souls"], NoGravity: 1}
execute at @e[type=leash_knot, tag=temp_soul] if entity @e[type=item_frame, distance=..4] run kill @e[type=leash_knot, tag = temp_soul]
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~8 ~ ~ {Tags:["soulswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~1 ~ ~ {Tags:["souls"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~2 ~ ~ {Tags:["souls"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~4 ~ ~ {Tags:["souls"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=soulswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=soulswait, limit=1] Tags set value ["souls"]
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~ ~ ~8 {Tags:["soulswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~ ~ ~1 {Tags:["souls"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~ ~ ~2 {Tags:["souls"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~ ~ ~4 {Tags:["souls"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=soulswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=soulswait, limit=1] Tags set value ["souls"]
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~ ~8 ~ {Tags:["soulswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~ ~1 ~ {Tags:["souls"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~ ~2 ~ {Tags:["souls"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=souls] run summon minecraft:area_effect_cloud ~ ~4 ~ {Tags:["souls"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=soulswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=soulswait, limit=1] Tags set value ["souls"]
execute as @e[type=minecraft:area_effect_cloud, tag=souls] at @s if block ~ ~ ~ minecraft:lava run data modify entity @s Tags set value ["lava_soul","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=souls] at @s if block ~ ~ ~ minecraft:soul_soil run data modify entity @s Tags set value ["soul_soul","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=souls] at @s if block ~ ~ ~ minecraft:blue_ice run data modify entity @s Tags set value ["ice_soul","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=souls] at @s if block ~ ~ ~ minecraft:basalt run data modify entity @s Tags set value ["basalt_soul","bas_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=souls]
execute as @e[type=minecraft:area_effect_cloud, tag=basalt_soul] at @s if entity @e[type=minecraft:area_effect_cloud, tag=lava_soul, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=soul_soul, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=ice_soul, distance=..1.1] run data modify entity @s Tags set value ["valid","soul","temp","bas_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=basalt_soul]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=soul, tag=temp] run tellraw @a ["",{"text":"[Soul Generator]","color":"#542A00"},{"text":" Found valid generator"}]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=soul, tag=temp] at @s run tag @s remove temp
