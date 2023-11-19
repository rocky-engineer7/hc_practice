require_relative 'pokemon'

# ZenigameクラスにPokemonクラスを継承させる
class Zenigame < Pokemon
  # 攻撃メソッド
  def attack
    super
    puts "#{@name}のみずてっぽう!"
  end
end
