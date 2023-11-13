# frozen_string_literal: true

# VendingMachineクラスの定義
class VendingMachine
  # 在庫情報への読み取り専用アクセスを提供する
  attr_reader :stock

  # 自動販売機の初期状態を設定
  def initialize
    pepsi = Juice.new("ペプシ", 150)
    @stock = { pepsi => 5 }
  end

  # 在庫情報を出力するメソッド
  def stock_info
    # 在庫ハッシュの各要素に対して繰り返し処理を行う
    @stock.map { |juice, count| "#{juice.name} - 価格: #{juice.price}円, 在庫: #{count}本" }
  end
end

# 自動販売機はペプシが購入できるかどうかを取得できる。

# ジュース値段以上のチャージ残高がある条件下で購入操作を行うと以下の動作をする

# 自動販売機はジュースの在庫を減らす
# 売り上げ金額を増やす
# Suicaのチャージ残高を減らす
# チャージ残高が足りない場合もしくは在庫がない場合、購入操作を行った場合は例外を発生させる

# 自動販売機は現在の売上金額を取得できる
