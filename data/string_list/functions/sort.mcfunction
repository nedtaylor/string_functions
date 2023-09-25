# store list in storage
data modify storage sort:list storage set value "sort:list"
$data modify storage sort:list list set value $(list)
data modify storage sort:list list_sorted set value []

# get length of list
execute store result storage sort:list len int 1 run data get storage sort:list list

# $data modify storage sort:storage uuid set value $(UUID)
# $execute store result storage sort:storage score int 1 run scoreboard players get @e[limit=1,nbt={UUID:$(UUID)}] sort
# function sort_deep with storage sort:storage
# $execute as [limit=1,nbt={UUID:$(uuid)}] run execute if entity @e[limit=1,sort=nearest,nbt=!{UUID:$(uuid)},scores={sort=$(score)}] run scoreboard players add @s sort 1

# get maxlen of list elements
function string_list:maxlen with storage sort:list

# pad list elements to largest
function string_list:pad with storage sort:list

# set up a new scoreboard objective for string_compare_sorter 
scoreboard objectives add string_compare_sorter dummy

# recursively summon armour stands until list len
# add tags to them
# set their scoreboard (string_compare_sorter) value for their string
scoreboard players set index string_compare_sorter 0
data modify storage sort:list index set value 0
execute store result score len string_compare_sorter run data get storage sort:list len
function string_list:_sort_summon_armor_stands with storage sort:list

# remove superfluous data tags
data remove storage sort:list list_padded
data remove storage sort:list string

# set scoreboard sort values
scoreboard objectives add list_sort dummy
scoreboard players set @e[type=minecraft:armor_stand,tag=sorter] list_sort 0
execute as @e[type=minecraft:armor_stand,tag=sorter] at @e[type=minecraft:armor_stand,tag=sorter] if score @s string_compare_sorter > @e[sort=nearest,limit=1,tag=sorter] string_compare_sorter run scoreboard players add @s list_sort 1

# remove temporary objective
scoreboard objectives remove string_compare_sorter

# initialise list indices
scoreboard players set index list_sort 0
scoreboard players set indexplus1 list_sort 1
execute store result score len list_sort run data get storage sort:list list

# initialise additional sort:list elements
data modify storage sort:list index set value 0
data modify storage sort:list indexplus1 set value 1
data modify storage sort:list uuid set from entity @e[type=minecraft:armor_stand,limit=1,tag=sorter,scores={list_sort=0}] UUID

# recursively run sort_recursive
function string_list:_sort_recursive with storage sort:list

# unset scoreboards
scoreboard objectives remove list_sort

# remove superfluous data tags
data remove storage sort:list uuid
data remove storage sort:list index
data remove storage sort:list indexplus1
data remove storage sort:list power
data remove storage sort:list len

# kill all armour stands with tag sort 
kill @e[type=armor_stand,tag=sorter]