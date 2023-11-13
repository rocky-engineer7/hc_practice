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
suica_card.charge(1000)

# チャージ後の残高を取得して表示
puts suica_card.balance

# 100円未満のチャージを試みて、例外を発生させる
begin
  suica_card.charge(99)
rescue Suica::DepositException => e
  puts e.message
end

# VendingMachineインスタンスを生成する
vending_machine = VendingMachine.new

puts "在庫情報: #{vending_machine.stock_info.join(', ')}"
