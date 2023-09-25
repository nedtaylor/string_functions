# temporarily remove sorter tag
$tag @e[type=armor_stand,limit=1,nbt={UUID:$(uuid)}] remove sorter

# $data modify storage sort:list list_sorted append from entity @e[type=armor_stand,limit=1,nbt={UUID:$(uuid)}] Tags[1]
$data modify storage sort:list list_sorted append from entity @e[type=armor_stand,limit=1,nbt={UUID:$(uuid)}] Tags[0]

# check for other armour stands with same score and increment theirs
$execute as @e[type=armor_stand,nbt=!{UUID:$(uuid)},scores={list_sort=$(index)}] run scoreboard players add @s list_sort 1

# add back sorter tag
$tag @e[type=armor_stand,limit=1,nbt={UUID:$(uuid)}] add sorter

# update index
execute store result storage sort:list index int 1 run scoreboard players add index list_sort 1
execute store result storage sort:list indexplus1 int 1 run scoreboard players add indexplus1 list_sort 1

# recursively execute, unless at max index
execute if score index list_sort >= len list_sort run return 0

# get next armour stand UUID
$data modify storage sort:list uuid set from entity @e[type=minecraft:armor_stand,limit=1,tag=sorter,scores={list_sort=$(indexplus1)}] UUID
function string_list:_sort_recursive with storage sort:list