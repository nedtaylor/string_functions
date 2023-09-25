# iterate lower and upper bounds of index
$execute store result score up_index string_compare run data get storage $(storage) up_index
scoreboard players add up_index string_compare 6
$execute store result storage $(storage) up_index int 1 run scoreboard players get up_index string_compare

# iterate power
$execute store result storage $(storage) power int 1 run scoreboard players add power string_compare 1

# exit if power is too high
execute if score power string_compare matches 7.. run return 0

# set temporary player name for numeric holder for higher power
$data modify storage $(storage) tmp_player set value "$(storage)_stor$(power)"

#continue recursive run
$function string:_to_numeric_recursive with storage $(storage)