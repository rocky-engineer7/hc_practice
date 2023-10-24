# frozen_string_literal: true

# macに入っているcalコマンドと同じ見た目になっていること
# ※ calコマンドは日曜始まりになっていますが、今回は月曜始まりで実装すること
# Gemは使わないこと
# Rubyの標準ライブラリは使用可能
# -mオプションで月を指定できるようにすること。今年が2022年なら cal -m 6で2022年6月のカレンダーになる。
# 引数を指定しない場合は、今月・今年のカレンダーが表示される
# -mの引数が不正な月の場合は次のエラーを出すこと

require "date"
require "optparse"

def print_calendar(year, month)
  # 指定された月の1日と最後の日を取得
  first_day = Date.new(year, month, 1)
  last_day = Date.new(year, month, -1)

  # カレンダーのヘッダーを表示
  puts "    #{month}月 #{year}    "
  puts "月 火 水 木 金 土 日"

  # 月の1日が始まる位置までスペースを表示
  print "   " * first_day.wday

  # 月の各日を表示
  (first_day..last_day).each do |date|
    print "#{date.day.to_s.rjust(2)} "
    # 土曜日なら改行
    puts if date.saturday?
  end

  puts
end

# コマンドラインオプションの解析
options = {}
opt = OptionParser.new
opt.on("-m month", Integer) { |month| options[:month] = month }
opt.parse!(ARGV)

# 現在の年と月を取得
now = Date.today
year = now.year

# 指定があった月、何も入力がなければ現在の月
month = options[:month] || now.month

# 月のバリデーション(入力値が1から12の整数以外だとエラーメッセージを表示させる)
if month < 1 || month > 12
  puts "#{month} is neither a month number (1..12) nor a name"
  exit
end

print_calendar(year, month)
