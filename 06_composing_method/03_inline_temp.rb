# 6.3 一時変数のインライン化
# 単純な式で1度だけ代入されている一時変数があり、その一時変数が他のリファクタリングの邪魔になっている。
base_price = an_order.base_price
return (base_price > 1000)
