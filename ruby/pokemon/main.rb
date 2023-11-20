# pokemon,pikachu,zenigam,playerクラスの読み込み
require_relative 'pokemon'
require_relative 'pikachu'
require_relative 'zenigame'
require_relative 'player'

# Pokemonクラスのインスタンスを生成し、lezardonに代入する
lezardon = Pokemon.new("リザードン", "ほのお", "ひこう", 100)
puts lezardon.get_name
puts lezardon.text
puts lezardon.type1
puts lezardon.attack

# Pikachuクラスのインスタンスを生成し、pikachuに代入する
pikachu = Pikachu.new("ピカチュウ", "でんき", "ねずみ", "80")
puts pikachu.get_name
puts pikachu.text
puts pikachu.type1
puts pikachu.attack

# Zenigameクラスのインスタンスを生成し、zenigameに代入する
zenigame = Zenigame.new("ゼニガメ", "みず", "こうら", "60")
puts zenigame.get_name
puts zenigame.text
puts zenigame.type1
puts zenigame.attack

# ポケモンの名前を変更する(不適切表現)
lezardon.change_name("うんこ")

# ポケモンの名前を変更して、再度名前を出力
lezardon.change_name("太郎")
puts lezardon.get_name

# プレイヤーの名前を生成し、名前を出力する
player = Player.new("サトシ")
puts player.get_name

# プレイヤーの名前を不適切な名前に変更する
puts player.change_name("うんこ")

# プレイヤーの名前を変更し、再度名前を出力する
player.change_name("カスミ")
puts player.get_name

# ピカチュウの名前を別の名前に変更する
pikachu.change_name("電気鼠")
puts pikachu.get_name
