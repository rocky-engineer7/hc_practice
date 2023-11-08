# frozen_string_literal: true

# テストケース1

# 入力

# 4,4,5,3,5,4,4,3,4,4,5,4,4,3,4,4,3,5
# 2,3,1,5,8,3,5,1,5,6,2,5,7,2,5,5,2,6
# 期待する出力

# イーグル,バーディ,コンドル,2ボギー,3ボギー,バーディ,ボギー,ホールインワン,ボギー,2ボギー,アルバトロス,ボギー,3ボギー,バーディ,ボギー,ボギー,バーディ,ボギー
# テストケース2

# 入力

# 4,4,3,5,4,4,5,3,4,5,4,3,4,4,4,3,5,4
# 5,2,1,2,1,3,4,2,7,5,4,2,1,7,8,2,3,2
# 期待する出力

# ボギー,イーグル,ホールインワン,アルバトロス,ホールインワン,バーディ,バーディ,バーディ,3ボギー,パー,パー,バーディ,ホールインワン,3ボギー,4ボギー,バーディ,イーグル,イーグル

# 規定打数(X)とプレイヤーの打数(Y)の入力を受け取り .mapで整数に変換する
X = gets.chomp.split(",").map(&:to_i)
Y = gets.chomp.split(",").map(&:to_i)

# プレイヤー打数(Y) - 規定打数(X)
scores = Y.each_with_index.map { |y, i| y - X[i] }

# 通常スコアを判断する
SCORE_MAPPING = {
  -3 => "アルバトロス",
  -2 => "イーグル",
  -1 => "バーディ",
  0 => "パー",
  1 => "ボギー",
}.freeze

# スコアをresultsに格納する
results = scores.each_with_index.map do |score, index|
  # ホールインワンとコンドルを先に判断する
  if (X[index] == 3 || X[index] == 4) && score == -(X[index] - 1)
    "ホールインワン"
  elsif X[index] == 5 && score == -4
    "コンドル"
  else
    SCORE_MAPPING[score] || "#{score.abs}ボギー"
  end
end

# 結果をカンマ区切りで出力する
puts results.join(",")