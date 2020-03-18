# 6.1 メソッドの抽出 : ローカル変数使用
# では、何が問題なのだろうか。
# それは、ローカル変数、つまり元のメソッドに渡されていた引数と元のメソッドの中で宣言されていた一時変数である。
# ローカル変数は、スコープがメソッド内に限られているので、「メソッドの抽出」をするときには、ローカル変数のために特別な仕事をしなければならない。
# 場合によっては、ローカル変数のためにリファクタリングができなくなることさえある。
#
# ローカル変数が含まれている場合でもっとも簡単なのは、その変数が読み出されるだけで変更されないときの処理である。
# この場合は、単純にローカル変数を引数として渡せばよい。
#
# そこで、次のようなメソッドがあるとき、
# 「詳細を表示」の部分は、引数を1個取るメソッドとして抽出することができる。
def print_owing
  outstanding = 0.0

  print_banner

  # 勘定を計算(calculate outstanding)
  @orders.each do |order|
    outstanding += order.amount
  end

  print_details(outstanding)
end

def print_banner
  # バナーを出力
  puts "*************************"
  puts "***** Customer Owes *****"
  puts "*************************"
end

def print_details(outstanding)
  # 詳細を表示(print details)
  puts "name: #{@name}"
  puts "amount: #{outstanding}"
end
