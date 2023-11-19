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
suica_card.charge(250)

# チャージ後の残高を取得して表示
puts suica_card.balance

# 100円未満のチャージを試みて、例外を発生させる

puts suica_card.charge(99)


# VendingMachineインスタンスを生成する
vending_machine = VendingMachine.new
# 在庫情報を出力する
puts "在庫情報: #{vending_machine.stock_info.join(', ')}"
# can_purchase?メソッドで、購入可否を出力する
puts vending_machine.can_purchase?("ペプシ", suica_card)
# process_purchaseでペプシの購入処理を行う
puts vending_machine.process_purchase("ペプシ", suica_card)
# 現在の売上金額を出力する
puts "現在の売上金額: #{vending_machine.check_sales}円"

# process_purchaseでペプシの購入処理を行う
puts vending_machine.process_purchase("ペプシ", suica_card)
# process_purchaseでペプシの購入処理を行う
puts vending_machine.process_purchase("ペプシ", suica_card)
# process_purchaseでペプシの購入処理を行う
puts vending_machine.process_purchase("ペプシ", suica_card)
# process_purchaseでペプシの購入処理を行う
puts vending_machine.process_purchase("ペプシ", suica_card)

# process_purchaseでペプシの購入処理を行う
puts vending_machine.process_purchase("ペプシ", suica_card)
# 在庫情報に存在しない場合、在庫がないと例外を発生させる
puts vending_machine.process_purchase("ジンジャエール", suica_card)
