execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!saved] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["c_saved"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!saved] at @s run tag @s add saved
