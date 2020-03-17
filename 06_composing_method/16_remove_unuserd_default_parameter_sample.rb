# 6.16 使われていないデフォルト引数の除去 : サンプル
# サンプルメソッドの引数リストは、search_criteriaにnilというデフォルト値を与えているが、
# その後にsearch_criteriaが明示的に渡されていなければ、@search_criteriaインスタンス変数を使うような条件分岐ロジックが使われている。
def product_count_items(search_criteria=nil)
  criteria = search_criteria | @search_criteria
  ProductCountItem.find_all_by_criteria(criteria)
end
# product_count_itemsを引数なしで呼び出すことがないのであれば、@search_criteriaを使うコードは誤解を招く。
# クラス内でインスタンス変数が使われているのがここだけなら、デフォルト値があるばかりに、インスタンス変数が削除できなくなっている。
