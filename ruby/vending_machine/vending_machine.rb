# frozen_string_literal: true

# VendingMachineクラスの定義
class VendingMachine
  # 在庫不足の例外処理
  class OutOfStockException < StandardError; end
  # 残高不足の例外処理
  class InsufficientBalanceException < StandardError; end
  # 在庫情報への読み取り専用アクセスを提供する
  attr_reader :stock
  attr_reader :sales

  # 自動販売機の初期状態を設定
  def initialize
    pepsi = Juice.new("ペプシ", 150)
    @stock = { pepsi => 5 }
    @sales = 0
  end

  # 在庫情報を出力するメソッド
  def stock_info
    # 在庫ハッシュの各要素に対して繰り返し処理を行う
    @stock.map { |juice, count| "#{juice.name} - 価格: #{juice.price}円, 在庫: #{count}本" }
  end

  # 自動販売機はペプシが購入できるかどうかを取得できる。
  def can_purchase?(juice_name, suica_card)
    # @stockをkeysメソッドで配列で返して、j.nameとjuice_nameを比較する
    juice = @stock.keys.find { |j| j.name == juice_name }

    if juice.nil?
      # 在庫リストにジュースが見つからない場合、在庫不足の例外を発生させる
      raise OutOfStockException, "#{juice_name}は在庫がありません。"
    # ジュースの価格と残高を比較する
    elsif juice.price > suica_card.balance
      # ジュースの価格がSuicaカードの残高よりも高い場合、残高不足の例外を発生させる
      raise InsufficientBalanceException, "残高不足です。"
    else
      # 在庫があって残高も足りていれば、購入可能のためtrueを返す
      true
    end
  end

  # ジュース値段以上のチャージ残高がある条件下で購入操作を行うと以下の動作をする
  def process_purchase(juice_name, suica_card)
    begin
    # can_purchase?で購入可否をチェックする
    can_purchase?(juice_name, suica_card)
    # 在庫からジュースを探す
    juice = @stock.keys.find { |j| j.name == juice_name }
    # 自動販売機はジュースの在庫を減らす
    @stock[juice] -= 1 if juice
    # 売上金額を増やす
    @sales += juice.price if juice
    # Suicaのチャージ残高を減らす
    suica_card.reduce_balance(juice.price) if juice

    # 在庫リストにジュースが見つからない場合、在庫不足の例外を発生させる
    rescue OutOfStockException => e
      puts e.message
    # ジュースの価格がSuicaカードの残高よりも高い場合、残高不足の例外を発生させる
    rescue InsufficientBalanceException => e
      puts e.message
    end
  end

  # 自動販売機は現在の売上金額を取得できる
  def check_sales
    @sales
  end
end
