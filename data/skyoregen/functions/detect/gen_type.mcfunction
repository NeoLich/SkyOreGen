execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:cobblestone",Count:1b,tag:{cob_generator:1b}}}] at @s run function skyoregen:detect/detect_cob
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:iron_ingot",Count:1b,tag:{iron1_generator:1b}}}] at @s run function skyoregen:detect/detect_iron1
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:iron_block",Count:1b,tag:{iron2_generator:1b}}}] at @s run function skyoregen:detect/detect_iron2
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:copper_block",Count:1b,tag:{copper_generator:1b}}}] at @s run function skyoregen:detect/detect_copper
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:coal_block",Count:1b,tag:{coal_generator:1b}}}] at @s run function skyoregen:detect/detect_coal
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:gold_ingot",Count:1b,tag:{gold1_generator:1b}}}] at @s run function skyoregen:detect/detect_gold1
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:gold_block",Count:1b,tag:{gold2_generator:1b}}}] at @s run function skyoregen:detect/detect_gold2
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:redstone",Count:1b,tag:{redstone1_generator:1b}}}] at @s run function skyoregen:detect/detect_redstone1
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:redstone_block",Count:1b,tag:{redstone2_generator:1b}}}] at @s run function skyoregen:detect/detect_redstone2
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:lapis_block",Count:1b,tag:{lapis_generator:1b}}}] at @s run function skyoregen:detect/detect_lapis
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:diamond",Count:1b,tag:{diamond1_generator:1b}}}] at @s run function skyoregen:detect/detect_diamond1
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:diamond_block",Count:1b,tag:{diamond2_generator:1b}}}] at @s run function skyoregen:detect/detect_diamond2
execute as @e[type=minecraft:item_frame, tag=c_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:stone",Count:1b,tag:{stone_generator:1b}}}] at @s run function skyoregen:detect/detect_stone

execute as @e[type=minecraft:item_frame, tag=b_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:quartz",Count:1b,tag:{quartz1_generator:1b}}}] at @s run function skyoregen:detect/detect_quartz1
execute as @e[type=minecraft:item_frame, tag=b_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:quartz_block",Count:1b,tag:{quartz2_generator:1b}}}] at @s run function skyoregen:detect/detect_quartz2
execute as @e[type=minecraft:item_frame, tag=b_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:netherite_ingot",Count:1b,tag:{netherite1_generator:1b}}}] at @s run function skyoregen:detect/detect_netherite1
execute as @e[type=minecraft:item_frame, tag=b_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:netherite_block",Count:1b,tag:{netherite2_generator:1b}}}] at @s run function skyoregen:detect/detect_netherite2
execute as @e[type=minecraft:item_frame, tag=b_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:netherrack",Count:1b,tag:{netherrack_generator:1b}}}] at @s run function skyoregen:detect/detect_netherrack
execute as @e[type=minecraft:item_frame, tag=b_generator_frame, tag=!tested, nbt={Item:{id:"minecraft:soul_soil",Count:1b,tag:{soul_generator:1b}}}] at @s run function skyoregen:detect/detect_soul

execute as @s at @s run tag @s add tested
