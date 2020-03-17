# 6.9 メソッドからメソッドオブジェクトへ
# 「メソッドの抽出」を適用できないようなローカル変数の使い方をしている長いメソッドがある。
class Order
  def price
    primary_base_price = 0
    secondary_base_price = 0
    tertiary_base_price = 0
  end
end
