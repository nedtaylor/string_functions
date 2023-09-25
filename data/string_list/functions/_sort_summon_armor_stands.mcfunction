# inputs: $(len) $(index)
# pass in sort:list data storage

# REPLACE WITH WORLD SPAWNPOINT
$summon minecraft:armor_stand -270 46 40$(index) {Tags:[sorter,placeholder]}
# $execute as @e[type=minecraft:armor_stand,tag=sorter,tag=placeholder,limit=1] run tp ~ ~ ~$(index)

# set current string to list[$(index)]
$data modify storage sort:list string set from storage sort:list list_padded[$(index)]

# call to_numeric function
function string:to_numeric with storage sort:list

# add string_numeric score to armour stand
execute store result score @e[type=armor_stand,tag=sorter,tag=placeholder,limit=1] string_compare_sorter run scoreboard players get sort:list string_compare

# replace placeholder tag with list[$(index)]
# data modify entity @e[type=armor_stand,tag=sorter,tag=placeholder,limit=1] Tags insert 1 from storage sort:list string
$data modify entity @e[type=minecraft:armor_stand,tag=sorter,tag=placeholder,limit=1] Tags append from storage sort:list list[$(index)]
tag @e[type=armor_stand,tag=sorter,tag=placeholder,limit=1] remove placeholder

# iterate index
scoreboard players add index string_compare_sorter 1
execute store result storage sort:list index int 1 run scoreboard players get index string_compare_sorter

# if len reached, return
execute if score index string_compare_sorter >= len string_compare_sorter run return 0

# recursively call self
function string_list:_sort_summon_armor_stands with storage sort:list