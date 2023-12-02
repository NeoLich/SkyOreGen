execute store result score feedback SkyoreGen run gamerule sendCommandFeedback
execute if score feedback SkyOreGen matches 1 run schedule function skyoregen:settings/reset_feedback 1t
gamerule sendCommandFeedback false
