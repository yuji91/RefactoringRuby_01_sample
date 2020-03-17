# 6.14 名前付き引数の導入 : すべての引数に名前を付ける
# 本の検索を行うSearchCriteriaオブジェクト、コンストラクタは引数としてauthor_id, publisher_id, isbnを取る
class SearchCriteria
  attr_reader :author_id, :publisher_id, :isbn

  def initialize(author_id, publisher_id, isbn)
    @author_id = author_id
    @publisher_id = publisher_id
    @isbn = isbn
  end
end

# クライアントコード
SearchCriteria.new(5, 8, "0201485672")

# クラス定義を見なければ、引数が何を表しているのかはよく分からない。
# そして、引数がどういう意味なのかが分からなければ、SearchCriteriaオブジェクトがどのように振る舞うかを推測する
