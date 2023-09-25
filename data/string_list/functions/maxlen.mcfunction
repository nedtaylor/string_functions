# initialise list_index to 0
$execute store result storage $(storage) list_index int 1 run scoreboard players set list_index string_compare 0
scoreboard players set maxlen string_compare 0

# initialise list length
$execute store result score list_len string_compare run data get storage $(storage) list

# recursively execute
$function string_list:_maxlen_recursive with storage $(storage)

# reset dummy scoreboard players
scoreboard players reset len_tmp string_compare
scoreboard players reset list_index string_compare
scoreboard players reset list_len string_compare
scoreboard players reset maxlen string_compare

# remove superfluous storage tags
$data remove storage $(storage) list_index