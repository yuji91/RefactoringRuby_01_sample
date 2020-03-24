# 6.9 メソッドからメソッドオブジェクトへ : サンプル
# 適切なサンプルを示そうとすると長い章が必要になるので、ここでは本来ならこのようなものを必要としないメソッドを使って
# このリファクタリングの方法を説明する
class Account
  def gamma(input_val, quantity, year_to_date)
    important_value1 = (input_val * quantity) + @account.delta
    important_value2 = (input_val * year_to_date) + 100
    if (year_to_date - important_value1) > 100
      important_value2 -= 20
    end
    important_value3 = important_value2 * 7
    # 等々
    important_value3 - 2 * important_value1
  end
end
# このメソッドをメソッドオブジェクトに書き換えるために、まず、新しいクラスを宣言する。
# 元のオブジェクトとメソッド内の引数、一時変数のための属性を宣言してある。
class Gamma
  attr_reader :account,
              :input_val,
              :quantity,
              :year_to_date,
              :important_value1,
              :important_value2,
              :important_value3
  # 次に、コンストラクタを追加する。
  def initialize(account, input_val_arg, quantity_arg, year_to_date_arg)
    @account = account
    @input_val = input_val_arg
    @quantity = quantity_arg
    @year_to_date = year_to_date_arg
  end
  # これで元のメソッドの受け入れ先ができた。
  # Accountのメンバの使っている部分は、@account インスタンス変数を使うように書き換えなければならない。
end
