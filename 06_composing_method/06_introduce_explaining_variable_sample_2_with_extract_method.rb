# 6.6 説明用変数の導入 : メソッドの抽出を使うと
# このサンプルの場合、通常の私なら説明用変数を導入しただけでは終わりにはしない。
# メソッドの抽出で同じことをするだろう。また同じコードからスタートしよう。
# しかし、今度は基本価格計算をメソッドにする。
# 同じことを1度に1つずつ行う。最終的には、次のような形になる。
def price
  base_price - quantity_discount + shipping
end

def base_price
  @quantity * @item_price
end

def quantity_discount
  [0, @quantity - 500].max * @item_price * 0.05
end

def shipping
  [base_price * 0.1, 100.0].min
end
