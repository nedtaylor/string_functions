# store $(storage) name in storage tag
$data modify storage $(storage) storage set value "$(storage)"
$data modify storage $(storage) tag set value "$(tag)"
$data modify storage $(storage) string set value "$(string)"

# store string in $(storage) $(tag)
$data modify storage $(storage) $(tag) set value "$(string)"

# set character index to length of $(string) 
$execute store result score index string_compare run data get storage $(storage) $(tag)

# store maxlen in scoreboard
$execute store result score maxlen string_compare run data get storage $(storage) $(len_tag)

# execute recursive padding
$execute if score index string_compare < maxlen string_compare run function string:pad_recursive with storage $(storage)
