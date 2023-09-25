# initialise index to 0
$execute store result storage $(storage) list_index int 1 run scoreboard players set list_index string_compare 0

# initialise list length
$execute store result score list_len string_compare run data get storage $(storage) list

# initialise maximum length of any index in list
$execute store result score maxlen string_compare run data get storage $(storage) maxlen

# set tags
$data modify storage $(storage) tag set value "string"
$data modify storage $(storage) len_tag set value "maxlen"

# initialise padded list
$data remove storage $(storage) list_padded

# recursively execute
$function string_list:_pad_recursive with storage $(storage)

# remove tags
$data remove storage $(storage) tag
$data remove storage $(storage) len_tag
$data remove storage $(storage) list_index

# reset indexing scores
scoreboard players reset len_tmp string_compare
scoreboard players reset list_index string_compare
scoreboard players reset list_len string_compare