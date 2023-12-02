
execute as @e[type=area_effect_cloud, tag=c_saved] at @s unless entity @e[type=minecraft:item_frame, tag=c_generator_frame, tag=saved, distance=0] run function skyoregen:c_frame/summon_frame
