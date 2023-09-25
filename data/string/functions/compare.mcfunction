# store $(storage) name in storage tag
data modify storage compare:strings storage set value "compare:strings"

# store strings
$data modify storage compare:strings string1 set value "$(string1)"
$data modify storage compare:strings string2 set value "$(string2)"

# store length of each string
execute store result score len1 string_compare run data get storage compare:strings string1
execute store result score len2 string_compare run data get storage compare:strings string2

# get max length
execute if score len1 string_compare >= len2 string_compare store result storage compare:strings maxlen int 1 run scoreboard players get len1 string_compare
execute if score len1 string_compare < len2 string_compare store result storage compare:strings maxlen int 1 run scoreboard players get len2 string_compare
execute store result score maxlen string_compare run data get storage compare:strings maxlen

# pad shorter string with trailing whitespace
$execute if score len1 string_compare > len2 string_compare run function string:pad {storage:"compare:strings", tag:"string2", string:"$(string2)", len_tag:"maxlen"}
$execute if score len1 string_compare < len2 string_compare run function string:pad {storage:"compare:strings", tag:"string1", string:"$(string1)", len_tag:"maxlen"}

# convert string1 to numeric
data modify storage compare:strings storage set value "compare:string1"
data modify storage compare:strings string set from storage compare:strings string1
function string:to_numeric with storage compare:strings

# convert string2 to numeric
data modify storage compare:strings storage set value "compare:string2"
data modify storage compare:strings string set from storage compare:strings string2
function string:to_numeric with storage compare:strings

# append string1 to list
$data modify storage compare:strings list set value ["$(string1)"]

# set power to 0
scoreboard players set power string_compare -1
data modify storage compare:strings append set value ""
scoreboard players operation maxpower string_compare = maxlen string_compare
scoreboard players operation maxpower string_compare /= 6 constants
data modify storage compare:strings power set value ""
data modify storage compare:strings base_player1 set value "compare:string1"
data modify storage compare:strings base_player2 set value "compare:string2"
data modify storage compare:strings storage set value "compare:strings"
$data modify storage compare:strings string1 set value "$(string1)"
$data modify storage compare:strings string2 set value "$(string2)"

# append or prepend string2, where appropriate
function string:compare_numerics with storage compare:strings