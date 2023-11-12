# frozen_string_literal: true

# Suicaクラス
class Suica
  # 100円未満のチャージを禁止する例外
  class DepositException < StandardError; end

  # @balanceの読み取り専用アクセスを提供する
  attr_reader :balance

  # 預かり金500円を引数で受け取り、＠balanceに代入する
  def initialize(balance = 500)
    @balance = balance
  end

  # チャージ処理
  def charge(amount)
    # もしチャージする金額が100円未満なら例外を発生させる
    raise DepositException, "100円未満のチャージはできません。" if amount < 100

    # 現在の残高とamountを加算してから、@balanceに代入する
    @balance += amount
  end
end

# ジュースの種類

# 初期状態でペプシ５本格納
# 在庫数を取得

# Juiceクラス
class Juice
  # name,priceの読み取り専用アクセスを提供する
  attr_reader :name, :price

  # ジュースの情報
  def initialize(name, price)
    @name = name
    @price = price
  end
end

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
