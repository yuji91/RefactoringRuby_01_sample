# 6.9 メソッドからメソッドオブジェクトへ : サンプル
# 適切なサンプルを示そうとすると長い章が必要になるので、ここでは本来ならこのようなものを必要としないメソッドを使って
# このリファクタリングの方法を説明する
class Account
  def gamma(input_val, quantity, year_to_date)
    Gamma.new(self, input_val, quantity, year_to_date).compute
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
  # そして、古いメソッドは、メソッドオブジェクトに処理を委ねる(委譲する)ように書き換える。
  def compute
    @important_value1 = (input_val * quantity) + @account.delta
    @important_value2 = (input_val * year_to_date) + 100
    important_thing
    @important_value3 = important_value2 * 7
    # and so on.
    @important_value3 - 2 * important_value1
  end
  # これはきわめて重要なリファクタリングである。
  # これにより、引数渡しなどの心配をせずに compute メソッドに対して簡単に「メソッドの抽出」(Extract Method)をかけられるようになる。
  def important_thing
    if (year_to_date - important_value1) > 100
      @important_value2 -= 20
    end
  end
end
