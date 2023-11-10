# frozen_string_literal: true

# main.rb
require_relative "vending_machine"

# Suicaインスタンスを生成する
suica_card = Suica.new

# 初期残高を取得
puts suica_card.balance

# チャージする
suica_card.charge(1000)

# チャージ残高を取得する
puts suica_card.balance

# 100円未満のチャージをして、例外を発生させる
suica_card.charge(99)
