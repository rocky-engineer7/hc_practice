# name_serviceを読み込み
require_relative 'name_service'

# ポケモンクラスを定義
class Pokemon
  # NameServiceモジュールを含めることで、名前の変更と取得のメソッドをこのクラスで利用可能にする
  include NameService
  # name,type1,type2,hp,text,textのゲッターメソッドを定義
  attr_reader :type1, :type2, :hp, :text
  # initialozeメソッドへname,type1,type2,hpの引数を渡す
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
    @text = "#{@name}は、#{@type1}タイプのポケモン。"
  end
  # 攻撃メソッド
  def attack
    puts "#{@name}のこうげき！"
  end
end
