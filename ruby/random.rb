# frozen_string_literal: true

# A、B、C、D、E、Fという6人のグループがありました。

# このグループは定期的にみんなで通話をしています。

# しかし6人全員で通話はやりずらいので、3人ずつか2人と4人に別れることにしました。

# このグループを3人と3人、または2人と4人にランダムに分けるプログラムを書いてください。

# このプログラムは実行するごとに結果が変わります。

# また表示結果はアルファベット順にしてください。

# 6人を配列で定義する
members = %w[A B C D E F]

# membersを3-3or2-4でグループ化した後にランダムで出力をする
def group_members(members)
  # シャッフル後3-3にグループ分けをしてアルファベット順に並び替えて配列に追加
  def process_3_3(shuffled_members)
    shuffled_members.each_slice(3).sort_by(&:first).to_a
  end

  # シャッフル後2-4にグループ分けをしてアルファベット順に並び替えて配列に追加
  def process_2_4(shuffled_members)
    [shuffled_members[0..1].sort, shuffled_members[2..5].sort]
  end

  shuffled_members = members.shuffle

  # randメソッドで実行する処理をランダムに決める
  choice = rand(2)

  result = if choice.zero?
             process_3_3(shuffled_members)
           else
             process_2_4(shuffled_members)
           end

  # リザルトの配列を出力
  result.each do |group|
    p group
  end
end

# メソッドを実行する
group_members(members)
