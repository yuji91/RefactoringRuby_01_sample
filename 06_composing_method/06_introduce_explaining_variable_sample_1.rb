# 6.6 説明用変数の導入 : サンプル
# 単純な計算からスタートする。
# 単純だが、もっとわかりやすくすることはできる。
# まず、基本価格(base_price)は、単価(@item_price)の数量(@quantity)倍である。
# 計算のその部分を一時変数に置き換える。
# 単価の数量倍は後でも使われるので、そこでも一時変数を使う。
# 次に数量割引(quantity_discount)を一時変数にする。
def price
  # 価格は、基本価格 - 送料割引 + 配送料
  base_price = @quantity * @item_price
  quantity_discount = [0, @quantity - 500].max * @item_price * 0.05
  return base_price -
      quantity_discount +
      [base_price * 0.1, 100.0].min
end
