# 6.9 メソッドからメソッドオブジェクトへ
# 「メソッドの抽出」を適用できないようなローカル変数の使い方をしている長いメソッドがある。
# -> メソッドを独自のオブジェクトに変え、すべてのローカル変数がそのオブジェクトのインスタンス変数になるようにする。
#    こうすれば、メソッドを分解して、同じオブジェクトの別のメソッドにすることが可能になる。
class Order
  def price
    return PriceCalculator.new(self).compute()
  end
end

class Price
  attr_reader :primary_base_price,
              :secondary_base_price,
              :tertiary_base_price

  def initialize(primary_base_price_arg, secondary_base_price_arg, tertiary_base_price_arg)
    @primary_base_price = primary_base_price_arg
    @secondary_base_price = secondary_base_price_arg
    @tertiary_base_price = tertiary_base_price_arg
  end
end

class PriceCalculator
  attr_reader :order

  def initialize(order)
    @order = order
  end

  def compute
    # @orderの内容によって計算時の条件を変える
    # case @order
  end
end
