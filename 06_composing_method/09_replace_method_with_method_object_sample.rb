# 6.9 メソッドからメソッドオブジェクトへ : サンプル
# 適切なサンプルを示そうとすると長い章が必要になるので、ここでは本来ならこのようなものを必要としないメソッドを使って
# このリファクタリングの方法を説明する
class Account
  def gamma(input_val, quantity, year_to_date)
    important_value1 = (input_val * quantity) + delta
    important_value2 = (input_val * year_to_date) + 100
    if (year_to_date - important_value1) > 100
      important_value2 -= 20
    end
    important_value3 = important_value2 * 7
    # 等々
    important_value3 - 2 * important_value1
  end
end
