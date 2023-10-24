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

# sampleメソッドを使用し、1か2をランダムに決定する
choice = (1..2).sample

# グループ分けをする
result = [shuffled_members[0..choice].sort, shuffled_members[(choice + 1)..5].sort].to_a

# 結果を出力
result.each {|group| p group}
