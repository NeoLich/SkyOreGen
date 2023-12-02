#Checks around generator frame for lava, blue ice, soul soil, and basalt; then checks what basalt are valid generators
#Called from detect:gen_type

execute at @e[type=minecraft:item_frame, tag=b_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:netherite_block",Count:1b,tag:{netherite2_generator:1b}}}] run summon minecraft:leash_knot ~ ~ ~ {Tags:["temp_netherite2"]}
execute at @e[type=minecraft:leash_knot, tag=temp_netherite2] run summon minecraft:area_effect_cloud ~-4 ~-4 ~-4 {Tags:["netherite2s"], NoGravity: 1}
execute at @e[type=leash_knot, tag=temp_netherite2] if entity @e[type=item_frame, distance=..4] run kill @e[type=leash_knot, tag = temp_netherite2]
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~8 ~ ~ {Tags:["netherite2swait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~1 ~ ~ {Tags:["netherite2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~2 ~ ~ {Tags:["netherite2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~4 ~ ~ {Tags:["netherite2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2swait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=netherite2swait, limit=1] Tags set value ["netherite2s"]
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~ ~ ~8 {Tags:["netherite2swait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~ ~ ~1 {Tags:["netherite2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~ ~ ~2 {Tags:["netherite2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~ ~ ~4 {Tags:["netherite2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2swait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=netherite2swait, limit=1] Tags set value ["netherite2s"]
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~ ~8 ~ {Tags:["netherite2swait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~ ~1 ~ {Tags:["netherite2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~ ~2 ~ {Tags:["netherite2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2s] run summon minecraft:area_effect_cloud ~ ~4 ~ {Tags:["netherite2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=netherite2swait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=netherite2swait, limit=1] Tags set value ["netherite2s"]
execute as @e[type=minecraft:area_effect_cloud, tag=netherite2s] at @s if block ~ ~ ~ minecraft:lava run data modify entity @s Tags set value ["lava_netherite2","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=netherite2s] at @s if block ~ ~ ~ minecraft:soul_soil run data modify entity @s Tags set value ["soul_netherite2","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=netherite2s] at @s if block ~ ~ ~ minecraft:blue_ice run data modify entity @s Tags set value ["ice_netherite2","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=netherite2s] at @s if block ~ ~ ~ minecraft:basalt run data modify entity @s Tags set value ["basalt_netherite2","bas_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=netherite2s]
execute as @e[type=minecraft:area_effect_cloud, tag=basalt_netherite2] at @s if entity @e[type=minecraft:area_effect_cloud, tag=lava_netherite2, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=soul_netherite2, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=ice_netherite2, distance=..1.1] run data modify entity @s Tags set value ["valid","netherite2","temp","bas_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=basalt_netherite2]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=netherite2, tag=temp] run tellraw @a ["",{"text":"[Netherite 2 Generator]","color":"gray"},{"text":" Found valid generator"}]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=netherite2, tag=temp] at @s run tag @s remove temp
