# reset
scoreboard players set @s sky_level 0
# toggle
execute if score level SkyOreGen matches 1.. run scoreboard players set level SkyOreGen 2
execute unless score level SkyOreGen matches 1.. run scoreboard players set level SkyOreGen 1
execute if score level SkyOreGen matches 2.. run scoreboard players set level SkyOreGen 0
# display on/off status
execute if score level SkyOreGen matches 1.. run title @a actionbar ["",{"text":">>>","color":"black"},{"text":"Sky","color":"aqua"},{"text":"Ore","color":"green"},{"text":"Gen","color":"gold"},{"text":" difficulty is now set to "},{"text":"HIGH","color":"red"},{"text":"<<<","color":"black"}]
execute unless score level SkyOreGen matches 1.. run title @a actionbar ["",{"text":">>>","color":"black"},{"text":"Sky","color":"aqua"},{"text":"Ore","color":"green"},{"text":"Gen","color":"gold"},{"text":" difficulty is now set to "},{"text":"NORMAL","color":"green"},{"text":"<<<","color":"black"}]

function skyoregen:settings/feedback