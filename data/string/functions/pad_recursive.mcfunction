# iterate index
scoreboard players add index string_compare 1

# update string and store in both $(tag) and string tags
$data modify storage $(storage) $(tag) set value "$(string) "
$data modify storage $(storage) string set from storage $(storage) $(tag)

# recursively execute self until padded string as long as maxlen
$execute if score index string_compare < maxlen string_compare run function string:pad_recursive with storage $(storage)
