# 6.8 引数への代入の除去 : サンプル
def discount(input_val, quantity, year_to_date)
  input_val -= 2 if input_val > 50
  input_val -= 1 if quantity > 100
  input_val -= 4 if year_to_date > 10000
  input_val
end
