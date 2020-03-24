# 6.8 引数への代入の除去 : サンプル
# 引数を一時変数に置き換えると、次のようになる。
def discount(input_val, quantity, year_to_date)
  result = input_val
  result -= 2 if input_val > 50
  result -= 1 if quantity > 100
  result -= 4 if year_to_date > 10000
  result
end
# Rubyでは、値渡しを使っていることが何かと混乱の原因になる。
# Rubyは、すべての箇所で厳密に値渡しを使っているので、
# 次のプログラムは、
x = 5
def triple(arg)
  arg = arg * 3
  puts "arg in triple: #{arg}"
end
triple x
puts "x after triple #{x}"
# 次のように出力する。
# arg in triple: 15
# x after triple 5
