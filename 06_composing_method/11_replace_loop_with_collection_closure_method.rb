# 6.11 ループからコレクションクロージャメソッドへ
# コレクションの要素をループで処理している。
managers = []
employees.each do |e|
  managers << e if e.manager?
end
