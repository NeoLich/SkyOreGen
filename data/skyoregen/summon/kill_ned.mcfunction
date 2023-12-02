execute as @e[type=minecraft:villager, name=Ned, tag=ned1] run title @a actionbar ["",{"text":">>>","color":"black"},{"text":"Ned","color":"red"},{"text":" is dead "},{"text":"<<<","color":"black"}]
execute as @e[type=minecraft:villager, name=Ned, tag=ned2] run title @a actionbar ["",{"text":">>>","color":"black"},{"text":"Ned","color":"red"},{"text":" is dead "},{"text":"<<<","color":"black"}]

execute as @e[type=minecraft:villager, name=Ned, tag=ned1] at @s run forceload remove ~ ~ ~ ~
execute as @e[type=minecraft:villager, name=Ned, tag=ned2] at @s run forceload remove ~ ~ ~ ~

kill @e[type=villager, name=Ned, tag=ned1]
kill @e[type=villager, name=Ned, tag=ned2]

scoreboard players set @a sky_ned 0

function skyoregen:settings/feedback
