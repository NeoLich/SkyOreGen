scoreboard players add hold SkyOreGen 2

tellraw @s ["",{"text":"","color":"white"}]
tellraw @s ["",{"text":"[NeoLich]","bold":true,"color":"red"},{"text":" Thank you for installing Skyblock Ore Generator","color":"white"}]
tellraw @s ["",{"text":"","color":"white"}]
tellraw @s ["",{"text":"[","color":"white"},{"text":"Sky","color":"aqua"},{"text":"Ore","color":"green"},{"text":"Gen","color":"gold"},{"text":"] This data pack will replace the cobblestone and basalt from generators with a random ore determined by the tier of said generator.","color":"white"}]
tellraw @s ["",{"text":"","color":"white"}]
tellraw @s ["",{"text":"[","color":"white"},{"text":"Sky","color":"aqua"},{"text":"Ore","color":"green"},{"text":"Gen","color":"gold"},{"text":"] The difficulty of the pack can be changed by ","color":"white"},{"text":"/trigger sky_level","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger sky_level"}}]
tellraw @s ["",{"text":"","color":"white"}]


function skyoregen:settings/feedback
