require_relative 'pokemon'

# PikachuクラスにPokemonクラスを継承させる
class Pikachu < Pokemon
  # 攻撃メソッド
  def attack
    # pokemonクラスのattackメソッドをオーバーライド
    super
    puts "#{@name}の10万ボルト!"
  end
end
