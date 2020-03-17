# 6.13 クラスアノテーションの導入
# 実装の手順がごく一般的なので、安全に隠してしまえるようなメソッドがある。
class SearchCriteria
  def initialize(hash)
    @author_id = hash[:author_id]
    @publisher_id = hash[:publisher_id]
    @isbn = hash[:isbn]
  end
end
