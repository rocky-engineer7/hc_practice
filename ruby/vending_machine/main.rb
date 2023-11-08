# main.rb
require_relative 'vending_machine'

# Suicaインスタンスを生成する
suica_card = Suica.new

# チャージする
suica_card.charge(1000)

# チャージ残高を取得する
puts suica_card.balance
