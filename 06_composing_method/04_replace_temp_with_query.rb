# 6.4 一時変数から問い合わせメソッドへ
# 一時変数を使って式の結果を保存している。
base_price = @quantity * @item_price

if (base_price > 1000)
  base_price * 0.95
else
  base_price * 0.98
end
