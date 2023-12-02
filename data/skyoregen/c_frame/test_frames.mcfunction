execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!saved] at @s run function skyoregen:c_frame/save_frame
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested] at @s run function skyoregen:detect/gen_type
