# append or prepend val2, where appropriate
$execute if score $(base_player1)$(append)$(power) string_compare < $(base_player2)$(append)$(power) string_compare run data modify storage compare:strings list append value "$(string2)"
$execute if score $(base_player1)$(append)$(power) string_compare > $(base_player2)$(append)$(power) string_compare run data modify storage compare:strings list prepend value "$(string2)"

# if equal to this power and this is the max power, append $(string2)
$execute if score power string_compare = maxpower string_compare run data modify storage compare:strings list append value "$(string2)"

# if equal to this power, return
$execute unless score $(base_player1)$(append)$(power) string_compare = $(base_player2)$(append)$(power) string_compare run return 0

# if 6 or more levels deep, return
execute if score power string_compare matches 6.. run return 0

# iterate power
scoreboard players add power string_compare 1
$execute if score power string_compare matches 1 run data modify storage $(storage) append set value "_stor"
$execute if score power string_compare matches 1.. store result storage $(storage) power int 1 run scoreboard players get power string_compare

# if same string this level, call recursively until difference found
$execute if score $(base_player1)$(append)$(power) string_compare = $(base_player2)$(append)$(power) string_compare run function string:compare_numerics with storage $(storage)
$execute if score $(base_player1)$(append)$(power) string_compare = $(base_player2)$(append)$(power) string_compare run return 0