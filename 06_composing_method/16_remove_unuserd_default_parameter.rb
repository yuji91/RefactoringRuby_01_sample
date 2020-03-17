# 6.16 使われていないデフォルト引数の除去
# 引数がデフォルト値を持っているが、その引数を指定せずにメソッドが呼び出されることはない。
def product_count_items(search_criteria=nil)
  criteria = search_criteria | @search_criteria
  ProductCountItem.find_all_by_criteria(criteria)
end
