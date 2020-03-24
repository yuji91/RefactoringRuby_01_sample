# 6.8 引数への代入の除去 : サンプル
# 引数を一時変数に置き換えると、次のようになる。
def discount(input_val, quantity, year_to_date)
  result = input_val
  result -= 2 if input_val > 50
  result -= 1 if quantity > 100
  result -= 4 if year_to_date > 10000
  result
end
# Rubyでは、値渡しを使っていることが何かと混乱の原因になる。
# Rubyは、すべての箇所で厳密に値渡しを使っているので、
# 次のプログラムは、
x = 5
def triple(arg)
  arg = arg * 3
  puts "arg in triple: #{arg}"
end
triple x
puts "x after triple #{x}"
# 次のように出力する。
# arg in triple: 15
# x after triple 5
#
# 混乱が起きるのは、オブジェクトの状態を変えるメソッドを呼び出せるためである。
class Ledger
  attr_reader :balance

  def initialize(balance)
    @balance = balance
  end

  def add(arg)
    @balance = arg
  end
end

class Product
  def self.add_price_by_updating(ledger, price)
    ledger.add(price)
    puts "ledger in add_price_by_updating: #{ledger.balance}"
  end

  def self.add_price_by_replacing(ledger, price)
    ledger = Ledger.new(ledger.balance + price)
    puts "ledger in add_price_by_replacing: #{ledger.balance}"
  end
end

l1 = Ledger.new(0)
Product.add_price_by_updating(l1, 5)
puts "l1 after add_price_by_updating: #{l1.balance}"

l2 = Ledger.new(0)
Product.add_price_by_replacing(l2, 5)
puts "l2 after add_price_by_replacing: #{l2.balance}"

# このコードは次のように出力する。
# ledger in add_price_by_updating: 5
# l1 after add_price_by_updating: 5
#
# ledger in add_price_by_replacing: 5
# l2 after add_price_by_replacing: 0
#
# オブジェクト参照は値渡しされる。
# オブジェクト参照を使ってメソッドを呼び出したり、状態に変更を加えたりすることは可能で、呼び出しスタックの上の方でも変更結果は有効である。
# しかし、オブジェクト参照に代入をしても、このオブジェクト参照は値渡しされているため、メソッド本体のスコープを離れると、この代入の効果は反映されなくなってしまう。
