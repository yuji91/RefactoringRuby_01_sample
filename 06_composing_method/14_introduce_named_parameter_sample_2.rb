# 6.14 名前付き引数の導入 : オプション引数だけに名前を付ける
# オプション引数と必須引数を区別すると、メソッドを呼び出そうとしているデベロッパにメソッドの使い方をより的確に伝えられる場合がある。
# たとえば、次のSQL構築コードについて考えてみよう。
class Books
  def self.find(selector, conditions="", *joins)
    sql =["SELECT * FROM books"]
    joins.each do |join_table|
      sql << "LEFT OUTER JOIN #{join_table} ON"
      sql << "books.#{join_table.to_s.chop}_id"
      sql << " = #{join_table}.id"
    end

    sql << "WHERE #{conditions}" unless conditions.empty?
    sql << "LIMIT 1" if selector == :first

    connection.find(sql.join(" "))
  end
end
# conditionsとjoinの2引数はともにオプションだが、selectorは必須である。
# selectorは、:all か :firstにすることができる。
# :all を指定すると、基準に合致するすべてのレコードが返されてくるのに対し、
# :firstを指定すると、基準に合致する最初のレコードだけが返されてくる。

# クライアントコード
Books.find(:all)
Books.find(:all, "title like '%Voodoo Economics'")
Books.find(:all, "authors.name = 'Jenny James'", :authors)
Books.find(:first, "authors.name = 'Jenny James'", :authors)

# conditions引数はSQLを知っているデベロッパには十分意味が分かるはずだが、joins引数はそれほど明確ではない。
