
schedule function skyoregen:loop 1

scoreboard players enable @a SkyOreGen
scoreboard players enable @a sky_greg
scoreboard players enable @a sky_ned
execute if score lock SkyOreGen matches 0 run scoreboard players enable @a sky_level

function skyoregen:summon/score_greg
function skyoregen:summon/score_ned
execute if score lock SkyOreGen matches 0 as @a[scores={sky_level=1..}] run function skyoregen:settings/level_trigger

function skyoregen:c_frame/loop
function skyoregen:b_frame/loop

