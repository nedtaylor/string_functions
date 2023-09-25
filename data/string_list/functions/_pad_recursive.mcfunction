# store list[$(list_index)] to string
$data modify storage $(storage) string set from storage $(storage) list[$(list_index)]

# get length of string
$execute store result score len_tmp string_compare run data get storage $(storage) string

# pad element in list[$(list_index)]
$execute if score len_tmp string_compare < maxlen string_compare run function string:pad with storage $(storage)
#$data modify storage $(storage) list[$(list_index)] set from storage $(storage) string
$data modify storage $(storage) list_padded append from storage $(storage) string

# increment list_index
$execute store result storage $(storage) list_index int 1 run scoreboard players add list_index string_compare 1

# if end of list, return
execute if score list_index string_compare >= list_len string_compare run return 0

# recursively execute self
$function string_list:_pad_recursive with storage $(storage)