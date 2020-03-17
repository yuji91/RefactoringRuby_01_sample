# 6.1 メソッドの抽出 : ローカル変数なし
# もっとも単純な条件のもとでは、「メソッドの抽出」 はばかばかしいほど簡単である。
# 次のメソッドについて考えてみよう。
def print_owing
  outstanding = 0.0

  # バナーを出力
  puts "*************************"
  puts "***** Customer Owes *****"
  puts "*************************"

  # 勘定を計算(calculate outstanding)
  @orders.each do |order|
    outstanding += order.amount
  end

  # 詳細を表示(print details)
  puts "name: #{@name}"
  puts "amount: #{outstanding}"
end
