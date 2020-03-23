# 6.8 引数への代入の除去 : サンプル
# 引数を一時変数に置き換えると、次のようになる。
def discount(input_val, quantity, year_to_date)
  result = input_val
  result -= 2 if input_val > 50
  result -= 1 if quantity > 100
  result -= 4 if year_to_date > 10000
  result
end
