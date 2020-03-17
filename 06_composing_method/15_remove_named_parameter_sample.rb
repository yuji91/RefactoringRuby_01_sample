# 6.15 名前付き引数の導入 : サンプル
# もう1度本の検索の例を使おう。しかし、今度はすべての引数が名前付き引数になっているものとする。
# 引数はすべてオプションである。そのため、呼び出し元のコードは、メソッドを様々な形で呼び出せることになる。
# クライアントコード
Books.find
Books.find(:selector => :all,
           :conditions => "authors.name = 'Jenny James'",
           :joins => [:authors])
Books.find(:selector => :first,
           :conditions => "authors.name = 'Jenny James'",
           :joins => [:authors])
# このコードには2つの問題点がある。
# まず、findメソッドの実装を見なければ、引数なしでBooks.findを呼び出したときにどうなるのかを予測するのが難しい。
# 1個の結果を返すのか、すべての結果を返すのか。それを知るためには、実装を見る必要がある。
class Books
  def self.find(hash={})
    hash[:joins] ||= []
    hash[:conditions] ||= ""

    sql =["SELECT * FROM books"]
    hash[:joins].each do |join_table|
      sql << "LEFT OUTER JOIN #{join_table}"
      sql << "ON books.#{join_table.to_s.chop}_id = #{join_table}.id"
    end

    sql << "WHERE #{hash[:conditions]}" unless hash[:conditions].empty?
    sql << "LIMIT 1" if hash[:selector] == :first

    connection.find(sql.join(" "))
  end
end
# メソッド全体を丹念に読むと、引数なしで呼び出したときには、合致するすべての本が返されることが分かる。
# せっかく名前付き引数を導入したのに、呼び出し元コードを理解するために実装を見に来なければならないという問題は無くなっていないのだ。
#
# 第2の問題点は、:selector引数の名前である。
# :selectorは、SQLのドメインでは意味が分からない。
# :limitとすればおそらくよくなるが、:limit => :all は少し奇妙だ。
# :selector引数を必須引数にすれば、両方の問題点が解決できる。
# selectorという名前は取り除かれ、すべての本を返してもらいたいときには、Books.find(:all)という構文を使う。
