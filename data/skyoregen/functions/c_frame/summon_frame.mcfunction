
execute as @e[type=area_effect_cloud, tag=c_saved] at @s[distance=..1] unless entity @e[type=minecraft:item_frame, tag=c_generator_frame, tag=saved, distance=0] run kill @e[type=item,nbt={Item:{id:"minecraft:item_frame",Count:1b}},distance=..1]
execute as @e[type=area_effect_cloud, tag=c_saved] at @s[] unless entity @e[type=minecraft:item_frame, tag=c_generator_frame, tag=saved, distance=0] run summon item ~ ~ ~ {Item:{id:"minecraft:item_frame",Count:1b,tag:{display:{Name:'{"text":"Cobblestone Generator Frame","color":"light_purple"}',Lore:['{"text":"Detects cobblestone generators within 4 blocks","color":"white"}']},EntityTag:{Tags:["c_generator_frame"]}}}}
execute as @e[type=area_effect_cloud, tag=c_saved] at @s[] unless entity @e[type=minecraft:item_frame, tag=c_generator_frame, tag=saved, distance=0] run kill @s
