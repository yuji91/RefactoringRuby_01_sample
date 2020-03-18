# 6.1 メソッドの抽出
# 1つにまとめられるコードの断片がある
# -> コードの断片をメソッドにして、その目的を説明する名前を付ける。
def print_owing(amount)
  print_banner
  print_details(amount)
end

def print_details(amount)
  puts "name: #{@name}"
  puts "amount #{amount}"
end
