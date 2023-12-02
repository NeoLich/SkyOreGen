execute as @e[type=minecraft:villager, name=Greg, tag=greg1] run title @a actionbar ["",{"text":">>>","color":"black"},{"text":"Greg","color":"green"},{"text":" is dead "},{"text":"<<<","color":"black"}]
execute as @e[type=minecraft:villager, name=Greg, tag=greg2] run title @a actionbar ["",{"text":">>>","color":"black"},{"text":"Greg","color":"green"},{"text":" is dead "},{"text":"<<<","color":"black"}]

execute as @e[type=minecraft:villager, name=Greg, tag=greg1] at @s run forceload remove ~ ~ ~ ~
execute as @e[type=minecraft:villager, name=Greg, tag=greg2] at @s run forceload remove ~ ~ ~ ~

kill @e[type=villager, name=Greg, tag=greg1]
kill @e[type=villager, name=Greg, tag=greg2]

scoreboard players set @a sky_greg 0

function skyoregen:settings/feedback
