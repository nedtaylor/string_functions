# ensure objetives are present
scoreboard objectives add string_compare dummy
scoreboard players set index string_compare 0

# store $(string) in $(storage) container
$data modify storage $(storage) val set value "$(string)"
$scoreboard players set $(storage) string_compare 0

# add tags to $(storage)
$data modify storage $(storage) tag set value "val"
$data modify storage $(storage) storage set value "$(storage)"
$data modify storage $(storage) tmp_player set value "$(storage)"
$execute store result storage $(storage) len int 1 run data get storage $(storage) val
$data modify storage $(storage) index set value 0
$data modify storage $(storage) up_index set value 6
$data modify storage $(storage) power set value 0

# reset scores for string numeric storage
$scoreboard players reset $(storage) string_compare
$scoreboard players reset $(storage)_stor0 string_compare
$scoreboard players reset $(storage)_stor1 string_compare
$scoreboard players reset $(storage)_stor2 string_compare
$scoreboard players reset $(storage)_stor3 string_compare
$scoreboard players reset $(storage)_stor4 string_compare
$scoreboard players reset $(storage)_stor5 string_compare
$scoreboard players reset $(storage)_stor6 string_compare
scoreboard players reset power string_compare

# run recursive character to numeric
$function string:_to_numeric_recursive with storage $(storage)

# remove superfluous tags
$data remove storage $(storage) tag
$data remove storage $(storage) val
$data remove storage $(storage) index
$data remove storage $(storage) up_index
$data remove storage $(storage) tmp_player
$data remove storage $(storage) tmp_player_base
$data remove storage $(storage) char
$data remove storage $(storage) indexplus1

$data remove storage $(storage) len
$data remove storage $(storage) power