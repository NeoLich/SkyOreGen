
execute as @e[type=minecraft:item_frame, tag=b_generator_frame, tag=tested, nbt=!{ItemRotation:0b}, limit=1] at @s run function skyoregen:b_frame/reset_frame
