execute as @p[scores={sky_greg=1}] at @s if score @p sky_greg matches 1 if score level SkyOreGen matches 0 run function skyoregen:summon/greg1
execute as @p[scores={sky_greg=1}] at @s if score @p sky_greg matches 1 if score level SkyOreGen matches 1 run function skyoregen:summon/greg2

execute as @p[scores={sky_greg=-1}] at @s if score @p sky_greg matches -1 run function skyoregen:summon/kill_greg

