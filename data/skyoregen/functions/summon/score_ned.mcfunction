execute as @p[scores={sky_ned=1}] at @s if score @p sky_ned matches 1 if score level SkyOreGen matches 0 run function skyoregen:summon/ned1
execute as @p[scores={sky_ned=1}] at @s if score @p sky_ned matches 1 if score level SkyOreGen matches 1 run function skyoregen:summon/ned2

execute as @p[scores={sky_ned=-1}] at @s if score @p sky_ned matches -1 run function skyoregen:summon/kill_ned