# 6.6 説明用変数の導入 : サンプル
# 単純な計算からスタートする。
# 単純だが、もっとわかりやすくすることはできる。
# まず、基本価格(base_price)は、単価(@item_price)の数量(@quantity)倍である。
# 計算のその部分を一時変数に置き換える。
def price
  # 価格は、基本価格 - 送料割引 + 配送料
  base_price = @quantity * @item_price
  return base_price -
      [0, @quantity - 500].max * @item_price * 0.05 +
      [@quantity * @item_price * 0.1, 100.0].min
end
