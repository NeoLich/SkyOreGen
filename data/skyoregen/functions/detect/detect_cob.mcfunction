#Checks around generator frame for water, lava, and cobblestone; then checks what cobblestone are valid generators
#Called from detect:gen_type

execute at @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:cobblestone",Count:1b,tag:{cob_generator:1b}}}] run summon minecraft:leash_knot ~ ~ ~ {Tags:["temp_cob"]}
execute at @e[type=minecraft:leash_knot, tag=temp_cob] run summon minecraft:area_effect_cloud ~-4 ~-4 ~-4 {Tags:["cobs"], NoGravity: 1}
execute at @e[type=leash_knot, tag=temp_cob] if entity @e[type=item_frame, distance=..4] run kill @e[type=leash_knot, tag = temp_cob]
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~8 ~ ~ {Tags:["cobswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~1 ~ ~ {Tags:["cobs"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~2 ~ ~ {Tags:["cobs"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~4 ~ ~ {Tags:["cobs"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=cobswait, limit=1] Tags set value ["cobs"]
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~ ~ ~8 {Tags:["cobswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~ ~ ~1 {Tags:["cobs"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~ ~ ~2 {Tags:["cobs"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~ ~ ~4 {Tags:["cobs"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=cobswait, limit=1] Tags set value ["cobs"]
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~ ~8 ~ {Tags:["cobswait"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~ ~1 ~ {Tags:["cobs"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~ ~2 ~ {Tags:["cobs"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobs] run summon minecraft:area_effect_cloud ~ ~4 ~ {Tags:["cobs"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute at @e[type=minecraft:area_effect_cloud, tag=cobswait] run data modify entity @e[type=minecraft:area_effect_cloud, tag=cobswait, limit=1] Tags set value ["cobs"]
execute as @e[type=minecraft:area_effect_cloud, tag=cobs] at @s if block ~ ~ ~ minecraft:lava run data modify entity @s Tags set value ["lava_cob","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=cobs] at @s if block ~ ~ ~ minecraft:water run data modify entity @s Tags set value ["water_cob","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=cobs] at @s if block ~ ~ ~ #minecraft:stairs[waterlogged=true] run data modify entity @s Tags set value ["water_cob","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=cobs] at @s if block ~ ~ ~ #minecraft:trapdoors[waterlogged=true] run data modify entity @s Tags set value ["water_cob","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=cobs] at @s if block ~ ~ ~ #minecraft:slabs[waterlogged=true] run data modify entity @s Tags set value ["water_cob","cob_gen"]
execute as @e[type=minecraft:area_effect_cloud, tag=cobs] at @s if block ~ ~ ~ minecraft:cobblestone run data modify entity @s Tags set value ["cobble_cob","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=cobs]
execute as @e[type=minecraft:area_effect_cloud, tag=cobble_cob] at @s if entity @e[type=minecraft:area_effect_cloud, tag=water_cob, distance=..1.1] if entity @e[type=minecraft:area_effect_cloud, tag=lava_cob, distance=..1.1] run data modify entity @s Tags set value ["valid","cob","temp","cob_gen"]
kill @e[type=minecraft:area_effect_cloud, tag=cobble_cob]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=cob, tag=temp] run tellraw @a ["",{"text":"[Cobblestone Generator]","color":"gray"},{"text":" Found valid generator"}]
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=cob, tag=temp] at @s run tag @s remove temp
