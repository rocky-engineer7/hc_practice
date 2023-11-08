# Suicaクラス
class Suica
  # 100円未満のチャージを禁止する例外
  class DepositException < StandardError; end
  # 預かり金500円を引数で受け取り、＠balanceに代入する
  def initialize(balance = 500)
    @balance = balance
  end
  # チャージ処理
  def charge(amount)
    # もしチャージする金額が100円未満なら例外を発生させる
    raise DepositException.new("100円未満のチャージはできません。") if amount < 100
    # 現在の残高とamountを加算してから、@balanceに代入する
    @balance += amount
  end
  # チャージ残高を取得する
  def balance
    puts @balance
  end
end
