# frozen_string_literal: true

# main.rb
require_relative "vending_machine"
require_relative "suica"
require_relative "juice"

# Suicaインスタンスを生成する
suica_card = Suica.new

# 初期残高を取得して表示
puts suica_card.balance

# チャージする
suica_card.charge(200)

# チャージ後の残高を取得して表示
puts suica_card.balance

# 100円未満のチャージを試みて、例外を発生させる
puts suica_card.charge(99)

# VendingMachineインスタンスを生成する
vending_machine = VendingMachine.new

# 在庫情報を出力する
puts vending_machine.stock_info

# can_purchase?メソッドで、購入可否を出力する
puts vending_machine.can_purchase?("ペプシ", suica_card)
# can_purchase?メソッドで、購入可否を出力する
puts vending_machine.can_purchase?("いろはす", suica_card)
# can_purchase?メソッドで、購入可否を出力する
puts vending_machine.can_purchase?("モンスター", suica_card)

# available_drinksで購入可能リストを取得する
puts vending_machine.available_drinks(suica_card)

# process_purchaseでペプシの購入処理を行う
puts vending_machine.process_purchase("ペプシ", suica_card)
# process_purchaseでいろはすの購入処理を行う
puts vending_machine.process_purchase("いろはす", suica_card)
# process_purchaseでモンスターの購入処理を行う
puts vending_machine.process_purchase("モンスター", suica_card)
# process_purchaseでモンスターの購入処理を行うが、残高不足で例外が発生しエラーメッセージを出力する
puts vending_machine.process_purchase("モンスター", suica_card)

# 在庫情報に存在しない場合、在庫がないと例外を発生させる
puts vending_machine.process_purchase("ジンジャエール", suica_card)

# restockでペプシを5本補充する
puts vending_machine.restock("ペプシ", 5)

# restockでコーヒーを5本補充する試みをして、例外を発生させる
puts vending_machine.restock("コーヒー", 5)
