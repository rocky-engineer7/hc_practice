# frozen_string_literal: true

# A、B、C、D、E、Fという6人のグループがありました。

# このグループは定期的にみんなで通話をしています。

# しかし6人全員で通話はやりずらいので、3人ずつか2人と4人に別れることにしました。

# このグループを3人と3人、または2人と4人にランダムに分けるプログラムを書いてください。

# このプログラムは実行するごとに結果が変わります。

# また表示結果はアルファベット順にしてください。


# 6人を配列で定義する
members = ["A", "B", "C", "D", "E", "F"]

# membersをシャッフルする
shuffled_members = members.shuffle

# randメソッドを使用し、0か1をランダムに決定する
choice = rand(2)

# 0なら3-3,1なら2-4でグループ分けをする
if choice == 0
  result = [shuffled_members[0..2].sort, shuffled_members[3..5].sort].to_a
else
  result = [shuffled_members[0..1].sort, shuffled_members[2..5].sort].to_a
end

# 結果を出力
result.each {|group| p group}
