# 6.18 動的レセプタから動的メソッド定義へ : ユーザー定義データを使ってメソッドを定義する
# method_missingを使わなくても、クラス定義の情報を利用すればメソッドを定義できることが多い。
# 例えば、次のコードはmethod_missingを使って属性の中にnilのものがあるかどうかを判定している。
class Person
  attr_accessor :name, :age

  def method_missing(sym, *args, &block)
    empty?(sym.to_s.sub(/^empty_/,"").chomp("?"))
  end

  def empty?(sym)
    self.send(sym).nil?
  end
end
# このコードは動作するが、今までのサンプルと同様のデバッグ問題を抱えている。
# 「動的メソッド定義」と「クラスアノテーションの導入」を使えば、
# 属性の定義とempty_attribute?メソッドの作成を同時に行なってこの問題を避けることができる。

