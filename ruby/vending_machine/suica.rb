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
    begin
      # もしチャージする金額が100円未満なら例外を発生させる
      raise DepositException, "100円未満のチャージはできません。" if amount < 100

      # 現在の残高とamountを加算してから、@balanceに代入する
      @balance += amount
      # 100円未満の例外メッセージを出力する
      rescue DepositException => e
        puts e.message
    end
  end

  # ジュース購入後残高を減らす
  def reduce_balance(amount)
    @balance -= amount
  end
end
