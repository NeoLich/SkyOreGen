
execute as @e[type=area_effect_cloud, tag=b_saved] at @s unless entity @e[type=minecraft:item_frame, tag=b_generator_frame, tag=b_saved, distance=0] run function skyoregen:b_frame/summon_frame
