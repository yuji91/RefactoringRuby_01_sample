# 6.1 メソッドの抽出 : ローカルへの再代入
# ローカル変数への代入がある場合には、話が複雑になってくる。
# ここで代入の対象となるのは一時変数だけである。
# 引数への代入を見つけた場合には、すぐに「引数への代入の除去」を行わなければならない。
# 一時変数の代入には、2つの場合がある。
# 簡単なのは、抽出したコードの中だけで使われる一時変数への代入で、 その場合は、抽出後のメソッドに一時変数を移してしまえばよい。
# もう1つは、抽出されたコードの外でも変数が使われている場合である。
# 抽出したコードよりも後の部分で変数が使われていなければ、抽出したコードの中で変数に変更を加えてしまってかまわない。
# しかし、抽出したコードよりも後の部分でも使われている場合には、抽出したコードから変数の変更後の値を返す必要がある。
#
# 次のメソッドはこれを具体的に説明してくれる。
def print_owing
  print_banner
  outstanding = calculate_outstanding
  print_details outstanding
end

def print_banner
  # バナーを出力
  puts "*************************"
  puts "***** Customer Owes *****"
  puts "*************************"
end

def print_details(outstanding)
  puts "name: #{@name}"
  puts "amount: #{outstanding}"
end

def calculate_outstanding
  # 勘定を計算(calculate outstanding)
  @orders.inject(0.0) { |result, order| result + order.amount }
end
# 抽出したメソッドをテストしてから、さらに配列に対するコレクションクロージャメソッドのinjectを使う。
