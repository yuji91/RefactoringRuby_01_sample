# 6.4 一時変数から問い合わせメソッドへ : サンプル
# 1度に1つずつ変数を置き換えていく。まず、代入の右辺を抜き出してメソッドにまとめる。
# ここでテストをしてから、「一時変数のインライン化」を始める。
# まず、最初の一時変数参照をメソッド呼び出しに書き換える。
# テストしてから、次を置換する(呼び出し元が一列に並んで踊るような感じである)。
# これが最後なので、一時変数への代入も削除する。
# 一時変数が1つ消えたので、同じようにdiscount_factorもメソッドにする。
def price
  a_discount_factor = discount_factor
  base_price * a_discount_factor
end

def base_price
  @quantity * @item_price
end

def discount_factor
  base_price > 1000 ? 0.95 : 0.98
end
