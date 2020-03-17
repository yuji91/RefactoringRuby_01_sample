# 6.13 クラスアノテーションの導入 : サンプル
# 引数をまとめたHashを受け付けて、それらの引数をインスタンス変数に代入するSearchCriteriaクラスがあるとする。
class SearchCriteria
  def initialize(hash)
    @author_id = hash[:author_id]
    @publisher_id = hash[:publisher_id]
    @isbn = hash[:isbn]
  end
end
# ここでは初期化を扱おうとしているので、コードを少しクリアにするために、「メソッド名の変更」を使うとともに、
# メソッドをクラススコープにする。initializeメソッドを動的に定義できるようにして、
# 任意のキー名リストを処理できるようにしたい。
