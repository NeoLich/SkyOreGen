#Replaces the cobblestone
#Called from all skyoregen:b_gen/*type*_gen
#Quartz Ore
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=basalt] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_quartz:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:nether_quartz_ore
#Gold Ore
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=basalt] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_gold:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:nether_gold_ore
#Ancient Debris
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=basalt] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_debris:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:ancient_debris
#Netherrack
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=basalt] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_netherrack:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:netherrack
#Soul Sand
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=basalt] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_soul_sand:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:soul_sand
#Soul Soil
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=basalt] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_soul_soil:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:soul_soil
#Removes placeholder item(white_dye)
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=basalt] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b}}]
