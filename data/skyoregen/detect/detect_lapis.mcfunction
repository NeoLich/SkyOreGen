#Checks around generator frame for water, lava, and cobblestone; then checks what cobblestone are valid generators
#Called from detect:gen_type

execute at @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:lapis_block",Count:1b,tag:{lapis_generator:1b}}}] run summon minecraft:leash_knot ~ ~ ~ {Tags:["temp_lapis"]}
execute at @e[type=minecraft:leash_knot, tag=temp_lapis] run summon minecraft:area_effect_cloud ~-4 ~-4 ~-4 {Tags:["lapis"], NoGravity: 1}
execute at @e[type=leash_knot, tag=temp_lapis] if entity @e[type=item_frame, distance=..4] run kill @e[type=leash_knot, tag = temp_lapis]
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~8 ~ ~ {Tags:["lapiswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~1 ~ ~ {Tags:["lapis"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~2 ~ ~ {Tags:["lapis"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~4 ~ ~ {Tags:["lapis"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapiswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=lapiswait, limit=1] Tags set value ["lapis"]
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~ ~ ~8 {Tags:["lapiswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~ ~ ~1 {Tags:["lapis"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~ ~ ~2 {Tags:["lapis"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~ ~ ~4 {Tags:["lapis"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapiswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=lapiswait, limit=1] Tags set value ["lapis"]
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~ ~8 ~ {Tags:["lapiswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~ ~1 ~ {Tags:["lapis"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~ ~2 ~ {Tags:["lapis"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapis] run summon minecraft:area_effect_cloud ~ ~4 ~ {Tags:["lapis"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=lapiswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=lapiswait, limit=1] Tags set value ["lapis"]
execute as @e[type=minecraft:area_effect_cloud, tag=lapis] at @s if block ~ ~ ~ minecraft:lava run data modify entity @s Tags set value ["lava_lapis","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=lapis] at @s if block ~ ~ ~ minecraft:water run data modify entity @s Tags set value ["water_lapis","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=lapis] at @s if block ~ ~ ~ #minecraft:stairs[waterlogged=true] run data modify entity @s Tags set value ["water_lapis","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=lapis] at @s if block ~ ~ ~ #minecraft:trapdoors[waterlogged=true] run data modify entity @s Tags set value ["water_lapis","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=lapis] at @s if block ~ ~ ~ #minecraft:slabs[waterlogged=true] run data modify entity @s Tags set value ["water_lapis","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=lapis] at @s if block ~ ~ ~ minecraft:cobblestone run data modify entity @s Tags set value ["cobble_lapis","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=lapis]
execute as @e[type=minecraft:area_effect_cloud, tag=cobble_lapis] at @s if entity @e[type=minecraft:area_effect_cloud, tag=water_lapis, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=lava_lapis, distance=..1.1] run data modify entity @s Tags set value ["valid","lapis","temp","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=cobble_lapis]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=lapis, tag=temp] run tellraw @a ["",{"text":"[Lapis Generator]","color":"blue"},{"text":" Found valid generator"}]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=lapis, tag=temp] at @s run tag @s remove temp
