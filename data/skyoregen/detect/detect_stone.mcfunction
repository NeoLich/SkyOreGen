#Checks around generator frame for water, lava, and cobblestone; then checks what cobblestone are valid generators
#Called from detect:gen_type

execute at @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:stone",Count:1b,tag:{stone_generator:1b}}}] run summon minecraft:leash_knot ~ ~ ~ {Tags:["temp_stone"]}
execute at @e[type=minecraft:leash_knot, tag=temp_stone] run summon minecraft:area_effect_cloud ~-4 ~-4 ~-4 {Tags:["stone"], NoGravity: 1}
execute at @e[type=leash_knot, tag=temp_stone] if entity @e[type=item_frame, distance=..4] run kill @e[type=leash_knot, tag = temp_stone]
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~8 ~ ~ {Tags:["stonewait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~1 ~ ~ {Tags:["stone"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~2 ~ ~ {Tags:["stone"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~4 ~ ~ {Tags:["stone"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stonewait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=stonewait, limit=1] Tags set value ["stone"]
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~ ~ ~8 {Tags:["stonewait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~ ~ ~1 {Tags:["stone"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~ ~ ~2 {Tags:["stone"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~ ~ ~4 {Tags:["stone"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stonewait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=stonewait, limit=1] Tags set value ["stone"]
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~ ~8 ~ {Tags:["stonewait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~ ~1 ~ {Tags:["stone"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~ ~2 ~ {Tags:["stone"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stone] run summon minecraft:area_effect_cloud ~ ~4 ~ {Tags:["stone"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=stonewait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=stonewait, limit=1] Tags set value ["stone"]
execute as @e[type=minecraft:area_effect_cloud, tag=stone] at @s if block ~ ~ ~ minecraft:lava run data modify entity @s Tags set value ["lava_stone","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=stone] at @s if block ~ ~ ~ minecraft:water run data modify entity @s Tags set value ["water_stone","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=stone] at @s if block ~ ~ ~ #minecraft:stairs[waterlogged=true] run data modify entity @s Tags set value ["water_stone","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=stone] at @s if block ~ ~ ~ #minecraft:trapdoors[waterlogged=true] run data modify entity @s Tags set value ["water_stone","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=stone] at @s if block ~ ~ ~ #minecraft:slabs[waterlogged=true] run data modify entity @s Tags set value ["water_stone","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=stone] at @s if block ~ ~ ~ minecraft:cobblestone run data modify entity @s Tags set value ["cobble_stone","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=stone]
execute as @e[type=minecraft:area_effect_cloud, tag=cobble_stone] at @s if entity @e[type=minecraft:area_effect_cloud, tag=water_stone, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=lava_stone, distance=..1.1] run data modify entity @s Tags set value ["valid","stone","temp","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=cobble_stone]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=stone, tag=temp] run tellraw @a ["",{"text":"[Stone Generator]","color":"dark_gray"},{"text":" Found valid generator"}]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=stone, tag=temp] at @s run tag @s remove temp
