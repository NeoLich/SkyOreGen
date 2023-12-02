#Checks around generator frame for lava, blue ice, soul soil, and basalt; then checks what basalt are valid generators
#Called from detect:gen_type

execute at @e[type=minecraft:item_frame, tag=b_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:quartz_block",Count:1b,tag:{quartz2_generator:1b}}}] run summon minecraft:leash_knot ~ ~ ~ {Tags:["temp_quartz2"]}
execute at @e[type=minecraft:leash_knot, tag=temp_quartz2] run summon minecraft:area_effect_cloud ~-4 ~-4 ~-4 {Tags:["quartz2s"], NoGravity: 1}
execute at @e[type=leash_knot, tag=temp_quartz2] if entity @e[type=item_frame, distance=..4] run kill @e[type=leash_knot, tag = temp_quartz2]
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~8 ~ ~ {Tags:["quartz2swait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~1 ~ ~ {Tags:["quartz2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~2 ~ ~ {Tags:["quartz2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~4 ~ ~ {Tags:["quartz2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2swait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=quartz2swait, limit=1] Tags set value ["quartz2s"]
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~ ~ ~8 {Tags:["quartz2swait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~ ~ ~1 {Tags:["quartz2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~ ~ ~2 {Tags:["quartz2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~ ~ ~4 {Tags:["quartz2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2swait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=quartz2swait, limit=1] Tags set value ["quartz2s"]
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~ ~8 ~ {Tags:["quartz2swait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~ ~1 ~ {Tags:["quartz2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~ ~2 ~ {Tags:["quartz2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2s] run summon minecraft:area_effect_cloud ~ ~4 ~ {Tags:["quartz2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=quartz2swait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=quartz2swait, limit=1] Tags set value ["quartz2s"]
execute as @e[type=minecraft:area_effect_cloud, tag=quartz2s] at @s if block ~ ~ ~ minecraft:lava run data modify entity @s Tags set value ["lava_quartz2","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=quartz2s] at @s if block ~ ~ ~ minecraft:soul_soil run data modify entity @s Tags set value ["soul_quartz2","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=quartz2s] at @s if block ~ ~ ~ minecraft:blue_ice run data modify entity @s Tags set value ["ice_quartz2","bas_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=quartz2s] at @s if block ~ ~ ~ minecraft:basalt run data modify entity @s Tags set value ["basalt_quartz2","bas_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=quartz2s]
execute as @e[type=minecraft:area_effect_cloud, tag=basalt_quartz2] at @s if entity @e[type=minecraft:area_effect_cloud, tag=lava_quartz2, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=soul_quartz2, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=ice_quartz2, distance=..1.1] run data modify entity @s Tags set value ["valid","quartz2","temp","bas_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=basalt_quartz2]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=quartz2, tag=temp] run tellraw @a ["",{"text":"[Quartz 2 Generator]","color":"white"},{"text":" Found valid generator"}]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=quartz2, tag=temp] at @s run tag @s remove temp
