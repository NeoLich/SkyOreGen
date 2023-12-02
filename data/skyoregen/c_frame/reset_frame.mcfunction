

execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=tested, nbt=!{ItemRotation:0b}] at @s[distance=..4] run kill @e[type=area_effect_cloud, tag=!c_saved, tag=!b_saved, tag=!bas_gen, distance=..4]
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=tested, nbt=!{ItemRotation:0b}] at @s run tag @s remove tested
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt=!{ItemRotation:0b}] at @s run data modify entity @s ItemRotation set value 0b
