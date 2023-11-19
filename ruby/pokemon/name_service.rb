# NameServiceモジュールを定義する
module NameService
  def change_name(new_name)
    # 不適切な名前に変更した場合は変更できない
    if new_name == "うんこ"
      puts "不適切な名前です"
      return
    end
    @name = new_name
  end

  def get_name
    @name
  end
end
