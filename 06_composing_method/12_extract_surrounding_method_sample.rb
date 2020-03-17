# 6.12 サンドイッチメソッドの抽出 :サンプル
# 家系図をモデリングしようとしており、
# 同じクラスへの自己参照的な一対多の関係 : Person(mother) has_many Person(children)
# を組み込んでいるPersonというクラスを作ってある
# 今の所は個々の子の母親を把握できれば良い
class Person
  attr_reader :mother, :children, :name

  def initialize(name, date_of_birth, date_of_death=nil, mother=nil)
    @name, @mother = name, mother, @date_of_birth, @date_of_death = date_of_birth, date_of_death
    @children = []
    @mother.add_child(self) if @mother
  end

  def add_child(child)
    @children << child
  end

  # Personクラスには、このリファクタリングに関連するメソッドが2つある。
  # 生きている子孫の数を数える
  def number_of_living_descendants
    children.inject(0) do |count, child|
      count += 1 if child.alive?
      count + child.number_of_living_descendants
    end
  end

  # 特定の名前を持つ子孫の数を数える
  def number_of_descendants_named(name)
    children.inject(0) do |count, child|
      count += 1 if child.name == name
      count + child.number_of_descendants_named(name)
    end
  end

  def alive?
    @date_of_death.nil?
  end
end
# これら2つのメソッドは、ともにchildrenコレクションを反復処理し、家系図を再帰下降していく。
# 再帰は単純な話では済まないので、正しく動作するようになったら、再帰ロジックの重複をできる限り取り除くことにしている。
# しかし、重複を取り除く方法は、簡単にわかるとは限らない。
# 状況に応じて使い方を変えられるように「メソッドのパラメータ化」ができれば（引数で差異を吸収できれば）、
# 「メソッドの抽出」でも重複を取り除けるが、この場合、重複はcountをインクリメントするかどうかを決定するコードであり、
# 個々のイテレーションで処理しているPersonオブジェクトの状態というコンテキストがなければこの決定は下せない。
#
# 幸い、Rubyのブロックを使えば、このコンテキストを提供できる。
# 毎回のイテレーションの途中でまず、重複しているコードの中の1つで「メソッドの抽出」を行う。
