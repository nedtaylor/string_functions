# need to store the character in index in the char tag!!!
$scoreboard players set indexplus1 string_compare $(index)
scoreboard players add indexplus1 string_compare 1
$execute store result storage $(storage) indexplus1 int 1 run scoreboard players get indexplus1 string_compare

# convert character at index to numeric
$function string:convert_char with storage $(storage)

# iterate index
scoreboard players add index string_compare 1
$execute store result storage $(storage) index int 1 run scoreboard players get index string_compare
$scoreboard players set indexplus1 string_compare $(index)
scoreboard players add indexplus1 string_compare 1

# move to next storage if too large
$execute if score index string_compare matches $(up_index).. run function string:to_numeric_raise_power with storage $(storage)
$execute if score index string_compare matches $(up_index).. run return 0

# recursive run if not at limit
$execute unless score indexplus1 string_compare matches $(len).. run scoreboard players operation $(tmp_player) string_compare *= 28 constants
$execute unless score indexplus1 string_compare matches $(len).. run function string:to_numeric_recursive with storage $(storage)