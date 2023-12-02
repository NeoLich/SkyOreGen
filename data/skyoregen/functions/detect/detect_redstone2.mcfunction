#Checks around generator frame for water, lava, and cobblestone; then checks what cobblestone are valid generators
#Called from detect:gen_type

execute at @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:redstone_block",Count:1b,tag:{redstone2_generator:1b}}}] run summon minecraft:leash_knot ~ ~ ~ {Tags:["temp_redstone2"]}
execute at @e[type=minecraft:leash_knot, tag=temp_redstone2] run summon minecraft:area_effect_cloud ~-4 ~-4 ~-4 {Tags:["redstone2s"], NoGravity: 1}
execute at @e[type=leash_knot, tag=temp_redstone2] if entity @e[type=item_frame, distance=..4] run kill @e[type=leash_knot, tag = temp_redstone2]
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~8 ~ ~ {Tags:["redstone2swait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~1 ~ ~ {Tags:["redstone2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~2 ~ ~ {Tags:["redstone2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~4 ~ ~ {Tags:["redstone2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2swait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=redstone2swait, limit=1] Tags set value ["redstone2s"]
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~ ~ ~8 {Tags:["redstone2swait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~ ~ ~1 {Tags:["redstone2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~ ~ ~2 {Tags:["redstone2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~ ~ ~4 {Tags:["redstone2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2swait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=redstone2swait, limit=1] Tags set value ["redstone2s"]
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~ ~8 ~ {Tags:["redstone2swait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~ ~1 ~ {Tags:["redstone2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~ ~2 ~ {Tags:["redstone2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2s] run summon minecraft:area_effect_cloud ~ ~4 ~ {Tags:["redstone2s"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=redstone2swait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=redstone2swait, limit=1] Tags set value ["redstone2s"]
execute as @e[type=minecraft:area_effect_cloud, tag=redstone2s] at @s if block ~ ~ ~ minecraft:lava run data modify entity @s Tags set value ["lava_redstone2","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=redstone2s] at @s if block ~ ~ ~ minecraft:water run data modify entity @s Tags set value ["water_redstone2","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=redstone2s] at @s if block ~ ~ ~ #minecraft:stairs[waterlogged=true] run data modify entity @s Tags set value ["water_redstone2","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=redstone2s] at @s if block ~ ~ ~ #minecraft:trapdoors[waterlogged=true] run data modify entity @s Tags set value ["water_redstone2","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=redstone2s] at @s if block ~ ~ ~ #minecraft:slabs[waterlogged=true] run data modify entity @s Tags set value ["water_redstone2","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=redstone2s] at @s if block ~ ~ ~ minecraft:cobblestone run data modify entity @s Tags set value ["cobble_redstone2","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=redstone2s]
execute as @e[type=minecraft:area_effect_cloud, tag=cobble_redstone2] at @s if entity @e[type=minecraft:area_effect_cloud, tag=water_redstone2, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=lava_redstone2, distance=..1.1] run data modify entity @s Tags set value ["valid","redstone2","temp","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=cobble_redstone2]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=redstone2, tag=temp] run tellraw @a ["",{"text":"[Redstone 2 Generator]","color":"red"},{"text":" Found valid generator"}]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=redstone2, tag=temp] at @s run tag @s remove temp
