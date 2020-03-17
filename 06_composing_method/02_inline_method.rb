# 6.2 メソッドのインライン化
# メソッドの本体が名前と同じくらいわかりやすい。
def get_rating
  more_than_five_late_deliveries ? 2 : 1
end

def more_than_five_late_deliveries
  @number_of_late_deliveries > 5
end
