# 6.4 一時変数から問い合わせメソッドへ : サンプル
# 1度に1つずつ変数を置き換えていく。まず、代入の右辺を抜き出してメソッドにまとめる。
# ここでテストをしてから、「一時変数のインライン化」を始める。
# まず、最初の一時変数参照をメソッド呼び出しに書き換える。
# テストしてから、次を置換する(呼び出し元が一列に並んで踊るような感じである)。
# これが最後なので、一時変数への代入も削除する。
def price
  if base_price > 1000
    discount_factor = 0.95
  else
    discount_factor = 0.98
  end
  base_price * discount_factor
end

def base_price
  @quantity * @item_price
end
