#Checks all iron1 generators
#Called from skyoregen:b_gen/valid_gen

#Checks to ensure Item Frame is still within range if not deletes area_effect_cloud
execute as @e[type=minecraft:area_effect_cloud, tag=valid, tag=netherite2] at @s unless entity @e[type=minecraft:item_frame, tag=b_generator_frame, nbt={Item:{id:"minecraft:netherite_block",Count:1b,tag:{netherite2_generator:1b}}}, distance=..4] run kill @e[type=area_effect_cloud, tag=!saved, distance=..4]

#Checks to see if air block is at valid
execute as @e[type=area_effect_cloud,tag=valid, tag=netherite2] at @s if block ~ ~ ~ air run tag @s add air

#Checks to see if lava block is at valid
execute as @e[type=area_effect_cloud,tag=valid, tag=netherite2, tag=air] at @s if block ~ ~ ~ basalt run tag @s add basalt

#Call iron1 loot table and then replace_ore
execute as @e[type=area_effect_cloud, tag=valid, tag=netherite2, tag=air, tag=basalt] at @s run loot spawn ~ ~ ~ loot skyoregen:entities/netherite2
execute as @e[type=area_effect_cloud, tag=valid, tag=netherite2, tag=air, tag=basalt] at @s run function skyoregen:b_gen/replace_ore

#Removes the tags on valid
execute as @e[type=area_effect_cloud, tag=valid, tag=netherite2, tag=air, tag=basalt] run tag @s remove air
execute as @e[type=area_effect_cloud, tag=valid, tag=netherite2, tag=basalt] run tag @s remove basalt
