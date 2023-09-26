# inputs: $(len) $(index)
# pass in sort:list data storage

# summon area of effects
$summon minecraft:area_effect_cloud ~ ~0.$(index) ~ {Duration:200,Radius:0.1f,Particle:"block air",Invisible:1b,Invulnerable:1b,Tags:["sorter","placeholder"]}

# set current string to list[$(index)]
$data modify storage sort:list string set from storage sort:list list_padded[$(index)]

# call to_numeric function
function string:to_numeric with storage sort:list

# add string_numeric score to area effect clouds
execute store result score @e[type=area_effect_cloud,tag=sorter,tag=placeholder,limit=1] string_compare_sorter run scoreboard players get sort:list string_compare

# replace placeholder tag with list[$(index)]
$data modify entity @e[type=area_effect_cloud,tag=sorter,tag=placeholder,limit=1] Tags append from storage sort:list list[$(index)]
tag @e[type=area_effect_cloud,tag=sorter,tag=placeholder,limit=1] remove placeholder

# iterate index
scoreboard players add index string_compare_sorter 1
execute store result storage sort:list index int 1 run scoreboard players get index string_compare_sorter

# if len reached, return
execute if score index string_compare_sorter >= len string_compare_sorter run return 0

# recursively call self
function string_list:_sort_summon_area_effect_clouds with storage sort:list