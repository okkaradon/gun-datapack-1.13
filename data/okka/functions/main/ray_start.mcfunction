#playsound minecraft:block.coral_block.break block @a ~ ~ ~ 0.5 2 0.1
playsound minecraft:entity.sheep.shear master @a ~ ~ ~ 0.5 2 0
playsound minecraft:block.lever.click master @a ~ ~ ~ 0.3 0.5 0
playsound minecraft:item.firecharge.use master @a ~ ~ ~ 0.1 2 0
#playsound minecraft:block.coral_block.break master @s ~ ~ ~ 0.5 1.5 0
scoreboard players remove @s ammo_per_click 1
#前のtickのrayを削除
kill @e[type=area_effect_cloud,tag=ray]

#@sの座標にray作成、向きを@sの方向にセット
summon area_effect_cloud ~ ~ ~ {Duration:1,Tags:[ray]}
tp @e[tag=ray,limit=1,sort=nearest] @s

#@sの目線の高さにtp
execute anchored eyes run tp @e[tag=ray,limit=1,sort=nearest] ^ ^ ^

#ray_loop 呼び出し
execute as @e[tag=ray,limit=1,sort=nearest] at @s run function okka:main/ray_move

execute as @e[tag=ray,limit=1,sort=nearest] at @s run function okka:main/recoil_maker