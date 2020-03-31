# 6.8 引数への代入の除去
# コードが引数に代入を行っている
# -> 変わりに一時変数を使う。
def discount(input_val, quantity, year_to_date)
  result = input_val
  if input_val > 50
    result -= 2
  end
end
