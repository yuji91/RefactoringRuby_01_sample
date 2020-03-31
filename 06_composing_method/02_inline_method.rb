# 6.2 メソッドのインライン化
# メソッドの本体が名前と同じくらいわかりやすい。
# -> メソッドの本体を呼び出し元の本体に組み込み、メソッドを削除する
def get_rating
  @number_of_late_deliveries > 5 ? 2 : 1
end
