# 6.1 メソッドの抽出 : ローカル変数なし
# もっとも単純な条件のもとでは、「メソッドの抽出」 はばかばかしいほど簡単である。
# 次のメソッドについて考えてみよう。
def print_owing
  outstanding = 0.0

  print_banner

  # 勘定を計算(calculate outstanding)
  @orders.each do |order|
    outstanding += order.amount
  end

  # 詳細を表示(print details)
  puts "name: #{@name}"
  puts "amount: #{outstanding}"
end
# コメントは、抽出できるメソッドを見分けるのに使えることが多い。
# また、コメント自体が抽出されたメソッドの名前の候補になる。
# たとえば、上のコードの場合、バナー出力機能はメソッド抽出の格好の候補である。
#
# バナーを出力するコードは、簡単に抽出できる。簡単にカットアンドペーストして、呼び出しにするだけだ。
def print_banner
  # バナーを出力
  puts "*************************"
  puts "***** Customer Owes *****"
  puts "*************************"
end
