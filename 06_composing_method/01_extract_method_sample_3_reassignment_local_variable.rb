# 6.1 メソッドの抽出 : ローカルへの再代入
# ローカル変数への代入がある場合には、話が複雑になってくる。
# ここで代入の対象となるのは一時変数だけである。
# 引数への代入を見つけた場合には、すぐに「引数への代入の除去」を行わなければならない。
# 一時変数の代入には、2つの場合がある。
# 簡単なのは、抽出したコードの中だけで使われる一時変数への代入で、 その場合は、抽出後のメソッドに一時変数を移してしまえばよい。
# もう1つは、抽出されたコードの外でも変数が使われている場合である。
# 抽出したコードよりも後の部分で変数が使われていなければ、抽出したコードの中で変数に変更を加えてしまってかまわない。
# しかし、抽出したコードよりも後の部分でも使われている場合には、抽出したコードから変数の変更後の値を返す必要がある。
#
# 次のメソッドはこれを具体的に説明してくれる。
def print_owing
  print_banner
  outstanding = calculate_outstanding
  print_details outstanding
end

def print_banner
  # バナーを出力
  puts "*************************"
  puts "***** Customer Owes *****"
  puts "*************************"
end

def print_details(outstanding)
  puts "name: #{@name}"
  puts "amount: #{outstanding}"
end

def calculate_outstanding
  # 勘定を計算(calculate outstanding)
  @orders.inject(0.0) { |result, order| result + order.amount }
end
# 抽出したメソッドをテストしてから、さらに配列に対するコレクションクロージャメソッドのinjectを使う。
#
# この場合、outstanding変数は、ごく当たり前な固定値で初期化されているだけなので、抽出したコード内だけで初期化できる。
# 変数がもう少し複雑な操作を受けている場合には、それまでの値を引数として新メソッドに渡さなければならない。
# リファクタリング前のコードが、次のようなものだったとすると、
def print_owing(previous_amount)
  print_banner
  outstanding = calculate_outstanding(previous_amount * 1.2)
  print_details outstanding
end

# 抽出したメソッドは次のようになる。
def calculate_outstanding(initial_value)
  @orders.inject(initial_value) { |result, order| result + order.amount }
end

# それでは、複数の変数を返さなければならなくなったらどうなるのだろうか。
# 多重代入を使えば複数の値を返すこともできるが、私はできる限り戻り値を1個に絞りたいと考えている。
# この場合なら、1つの値だけを返すメソッドを複数抽出する方法を考える。
#
# 一時変数が多すぎて、メソッドの抽出が非常にやりにくくなることがよくある。
# そのような場合には、「一時変数から問い合わせメソッドへ」(Replace Temp with Query)を使って一時変数を減らすことを考える。
# 何をやってもまだしっくりこない場合は、「メソッドからメソッドオブジェクトへ」(Replace Method with Method Object)を使う。
# このリファクタリングなら、一時変数がいくつかあっても、それらを使って何をしていても、対応できる。
