# 6.17 動的メソッド定義 : def_eachを使って類似メソッドを定義する
# 複数の類似メソッドを定義するのは冗長であり、そのようなことをしなくても済むことが多い。
# 例えば、次の各メソッドは、単純にstateへの代入を行なっている。
def failure
  self.state = :failure
end

def error
  self.state = :error
end

def success
  self.state = :success
end
# 以上のコードは完璧に正しく動作するが、11行ものソースコードを消費するにしては、似ている。
