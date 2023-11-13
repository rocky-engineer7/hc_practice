# frozen_string_literal: true

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
