# set char tag to character at $(index) in $(tag) element
$data modify storage $(storage) char set string storage $(storage) $(tag) $(index) $(indexplus1)

# set score based on character
$execute if data storage $(storage) {char:" "} run scoreboard players add $(tmp_player) string_compare 0
$execute if data storage $(storage) {char:"a"} run scoreboard players add $(tmp_player) string_compare 1
$execute if data storage $(storage) {char:"b"} run scoreboard players add $(tmp_player) string_compare 2
$execute if data storage $(storage) {char:"c"} run scoreboard players add $(tmp_player) string_compare 3
$execute if data storage $(storage) {char:"d"} run scoreboard players add $(tmp_player) string_compare 4
$execute if data storage $(storage) {char:"e"} run scoreboard players add $(tmp_player) string_compare 5
$execute if data storage $(storage) {char:"f"} run scoreboard players add $(tmp_player) string_compare 6
$execute if data storage $(storage) {char:"g"} run scoreboard players add $(tmp_player) string_compare 7
$execute if data storage $(storage) {char:"h"} run scoreboard players add $(tmp_player) string_compare 8
$execute if data storage $(storage) {char:"i"} run scoreboard players add $(tmp_player) string_compare 9
$execute if data storage $(storage) {char:"j"} run scoreboard players add $(tmp_player) string_compare 10
$execute if data storage $(storage) {char:"k"} run scoreboard players add $(tmp_player) string_compare 11
$execute if data storage $(storage) {char:"l"} run scoreboard players add $(tmp_player) string_compare 12
$execute if data storage $(storage) {char:"m"} run scoreboard players add $(tmp_player) string_compare 13
$execute if data storage $(storage) {char:"n"} run scoreboard players add $(tmp_player) string_compare 14
$execute if data storage $(storage) {char:"o"} run scoreboard players add $(tmp_player) string_compare 15
$execute if data storage $(storage) {char:"p"} run scoreboard players add $(tmp_player) string_compare 16
$execute if data storage $(storage) {char:"q"} run scoreboard players add $(tmp_player) string_compare 17
$execute if data storage $(storage) {char:"r"} run scoreboard players add $(tmp_player) string_compare 18
$execute if data storage $(storage) {char:"s"} run scoreboard players add $(tmp_player) string_compare 19
$execute if data storage $(storage) {char:"t"} run scoreboard players add $(tmp_player) string_compare 20
$execute if data storage $(storage) {char:"u"} run scoreboard players add $(tmp_player) string_compare 21
$execute if data storage $(storage) {char:"v"} run scoreboard players add $(tmp_player) string_compare 22
$execute if data storage $(storage) {char:"w"} run scoreboard players add $(tmp_player) string_compare 23
$execute if data storage $(storage) {char:"x"} run scoreboard players add $(tmp_player) string_compare 24
$execute if data storage $(storage) {char:"y"} run scoreboard players add $(tmp_player) string_compare 25
$execute if data storage $(storage) {char:"z"} run scoreboard players add $(tmp_player) string_compare 26
$execute if data storage $(storage) {char:"_"} run scoreboard players add $(tmp_player) string_compare 27