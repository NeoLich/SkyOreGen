#Checks around generator frame for water, lava, and cobblestone; then checks what cobblestone are valid generators
#Called from detect:gen_type

execute at @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:coal_block",Count:1b,tag:{coal_generator:1b}}}] run summon minecraft:leash_knot ~ ~ ~ {Tags:["temp_coal"]}
execute at @e[type=minecraft:leash_knot, tag=temp_coal] run summon minecraft:area_effect_cloud ~-4 ~-4 ~-4 {Tags:["coals"], NoGravity: 1}
execute at @e[type=leash_knot, tag=temp_coal] if entity @e[type=item_frame, distance=..4] run kill @e[type=leash_knot, tag = temp_coal]
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~8 ~ ~ {Tags:["coalswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~1 ~ ~ {Tags:["coals"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~2 ~ ~ {Tags:["coals"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~4 ~ ~ {Tags:["coals"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coalswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=coalswait, limit=1] Tags set value ["coals"]
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~ ~ ~8 {Tags:["coalswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~ ~ ~1 {Tags:["coals"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~ ~ ~2 {Tags:["coals"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~ ~ ~4 {Tags:["coals"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coalswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=coalswait, limit=1] Tags set value ["coals"]
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~ ~8 ~ {Tags:["coalswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~ ~1 ~ {Tags:["coals"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~ ~2 ~ {Tags:["coals"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coals] run summon minecraft:area_effect_cloud ~ ~4 ~ {Tags:["coals"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=coalswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=coalswait, limit=1] Tags set value ["coals"]
execute as @e[type=minecraft:area_effect_cloud, tag=coals] at @s if block ~ ~ ~ minecraft:lava run data modify entity @s Tags set value ["lava_coal","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=coals] at @s if block ~ ~ ~ minecraft:water run data modify entity @s Tags set value ["water_coal","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=coals] at @s if block ~ ~ ~ #minecraft:stairs[waterlogged=true] run data modify entity @s Tags set value ["water_coal","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=coals] at @s if block ~ ~ ~ #minecraft:trapdoors[waterlogged=true] run data modify entity @s Tags set value ["water_coal","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=coals] at @s if block ~ ~ ~ #minecraft:slabs[waterlogged=true] run data modify entity @s Tags set value ["water_coal","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=coals] at @s if block ~ ~ ~ minecraft:cobblestone run data modify entity @s Tags set value ["cobble_coal","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=coals]
execute as @e[type=minecraft:area_effect_cloud, tag=cobble_coal] at @s if entity @e[type=minecraft:area_effect_cloud, tag=water_coal, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=lava_coal, distance=..1.1] run data modify entity @s Tags set value ["valid","coal","temp","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=cobble_coal]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=coal, tag=temp] run tellraw @a ["",{"text":"[Coal Generator]","color":"dark_gray"},{"text":" Found valid generator"}]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=coal, tag=temp] at @s run tag @s remove temp
