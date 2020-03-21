# 6.4 一時変数から問い合わせメソッドへ : サンプル
# 1度に1つずつ変数を置き換えていく。まず、代入の右辺を抜き出してメソッドにまとめる。
def price
  a_base_price = base_price
  if a_base_price > 1000
    discount_factor = 0.95
  else
    discount_factor = 0.98
  end
  a_base_price * discount_factor
end

def base_price
  @quantity * @item_price
end
