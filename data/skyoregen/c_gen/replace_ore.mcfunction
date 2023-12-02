#Replaces the cobblestone
#Called from all skyoregen:c_gen/*type*_gen

#DripStone
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=cobblestone] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_drip:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:dripstone_block
#Coal Ore
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=cobblestone] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_coal:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:coal_ore
#Iron Ore
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=cobblestone] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_iron:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:iron_ore
#Copper Ore
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=cobblestone] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_copper:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:copper_ore
#Gold Ore
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=cobblestone] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_gold:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:gold_ore
#Redstone Ore
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=cobblestone] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_redstone:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:redstone_ore
#Lapis Ore
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=cobblestone] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_lapis:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:lapis_ore
#Diamond Ore
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=cobblestone] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_diamond:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:diamond_ore
#Stone
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=cobblestone] at @s if entity @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b,tag:{summon_stone:1b}}}, distance=0] run setblock ~ ~ ~ minecraft:stone
#Removes placeholder item(white_dye)
execute as @e[type=area_effect_cloud, tag=valid, tag=air, tag=cobblestone] at @s run kill @e[type=item,nbt={Item:{id:"minecraft:white_dye",Count:1b}}]
