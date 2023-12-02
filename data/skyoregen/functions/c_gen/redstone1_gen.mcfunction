#Checks all redstone1 generators
#Called from skyoregen:c_gen/valid_gen

#Checks to ensure Item Frame is still within range if not deletes area_effect_cloud
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=redstone1] at @s unless entity @e[type=minecraft:item_frame, tag=c_generator_frame, nbt={Item:{id:"minecraft:redstone",Count:1b,tag:{redstone1_generator:1b}}}, distance=..4] run kill @e[type=area_effect_cloud, tag=!saved, distance=..4]

#Checks to see if air block is at valid
execute as @e[type=area_effect_cloud,tag=valid, tag=redstone1] at @s if block ~ ~ ~ air run tag @s add air

#Checks to see if lava block is at valid
execute as @e[type=area_effect_cloud,tag=valid, tag=redstone1, tag=air] at @s if block ~ ~ ~ cobblestone run tag @s add cobblestone

#Call redstone1 loot table and then replace_ore
execute as @e[type=area_effect_cloud, tag=valid, tag=redstone1, tag=air, tag=cobblestone] at @s if score level SkyOreGen matches 0 run loot spawn ~ ~ ~ loot skyoregen:entities/redstone1
execute as @e[type=area_effect_cloud, tag=valid, tag=redstone1, tag=air, tag=cobblestone] at @s if score level SkyOreGen matches 1 run loot spawn ~ ~ ~ loot skyoregen:entities/redstone1_2
execute as @e[type=area_effect_cloud, tag=valid, tag=redstone1, tag=air, tag=cobblestone] at @s run function skyoregen:c_gen/replace_ore

#Removes the tags on valid
execute as @e[type=area_effect_cloud, tag=valid, tag=redstone1, tag=air, tag=cobblestone] run tag @s remove air
execute as @e[type=area_effect_cloud, tag=valid, tag=redstone1, tag=cobblestone] run tag @s remove cobblestone
