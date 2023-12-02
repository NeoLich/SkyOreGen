
function skyoregen:loop

scoreboard objectives add sky_greg trigger {"text":"Greg","color":"green"}
scoreboard objectives add sky_ned trigger {"text":"Ned","color":"red"}
scoreboard objectives add sky_level trigger {"text":"Difficulty","color":"gold"}

scoreboard objectives add SkyOreGen dummy
execute unless score level SkyOreGen = level SkyOreGen run scoreboard players set level SkyOreGen 0
execute unless score lock SkyOreGen = lock SkyOreGen run scoreboard players set lock SkyOreGen 0

