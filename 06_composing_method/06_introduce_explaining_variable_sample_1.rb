# 6.6 説明用変数の導入 : サンプル
# 単純な計算からスタートする。
def price
  # 価格は、基本価格 - 送料割引 + 配送料
  return @quantity * @item_price -
      [0, @quantity - 500].max * @item_price * 0.05 +
      [@quantity * @item_price * 0.1, 100.0].min
end
