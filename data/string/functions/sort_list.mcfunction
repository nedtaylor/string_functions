# execute as @e[type=minecraft:armor_stand,scores={string_compare=1..}] at @s run tp @s ~ ~2 ~

# execute as @e[type=minecraft:armor_stand,scores={string_compare=1..}] run 

# execute as all armour stands that have the storage tag and run a function

execute as @e[type=minecraft:armor_stand,tag="sorter"] run function NEW with entity @s

## FUNCTION NEW
$execute store result storage sorter_$(name) run function 

# /tp @e[nbt={UUID:[I;-2002339731,-206550968,-2042015981,-1471374668]}] ~ ~2 ~
# just use the nbt={$(UUID)} 
# somehow need to get their score, pass that to a function and use that score variable to compare to all others
# i.e. $execute at @s as @e[scores={string_compare=..$(score)}] run tp (maybe a rotation thing rather than location, or tp all within a certain distance closer?)

Just store result of getting all entities that have a score below theirs.
That is their order. i.e. a score of 0 will have none below it, so it returns a result of 0, which means it is 0 in the list (probably will always also return itself, so score of 1 in list)


# need to store length of list to loop up to
execute store result order string_compare run score

# execute store result score @e[type=minecraft:armor_stand,distance=..5] string_compare run execute as @a[scores={string_compare=..30}] run scoreboard players get @s string_compare

/execute store result score @e[type=minecraft:armor_stand,distance=..5] string_compare run execute as @e[type=minecraft:armor_stand,scores={string_compare=..30}] run scoreboard players get @s string_compare

execute as @e if score @s id = @p id run scoreboard players add @p controlledEntities 1

/execute as @e if score @s string_compare matches ..20 run scoreboard players add @p controlledEntities 1

# this looks the best
execute store result score @s sort run execute as @s ....
/execute as @s if entity @e[type=minecraft:armor_stand,scores={string_compare=..20}]

/execute as @e[score={sort=$(score)}] if entity @e[type=minecraft:armor_stand,scores={string_compare=..20}]

/execute as nedanator at @e[limit=1,sort=nearest,nbt=!{UUID:}] run setblock ~ ~ ~ stone replace
/tp @e[nbt={UUID:[I;-2002339731,-206550968,-2042015981,-1471374668]}] ~ ~2 ~


/execute as nedanator at @e[limit=1,sort=nearest,nbt=!{UUID:[I;-2002339731,-206550968,-2042015981,-1471374668]}] run setblock ~ ~ ~ stone replace
/tp @e[nbt={UUID:[I;-2002339731,-206550968,-2042015981,-1471374668]}] ~ ~2 ~

UUID:[I;-943730201,-1878179729,-1404651833,1542488330]
