# 6.17 動的メソッド定義
# 動的に定義すればもっと簡潔に定義できるメソッドがある。
def failure
  self.state = :failure
end

def error
  self.state = :error
end
