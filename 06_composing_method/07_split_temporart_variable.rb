# 6.7 説明用変数の導入
# ループ変数でも計算結果の蓄積用の変数でもないのに、複数回代入される一時変数がある。
temp = 2 * (@height + @width)
puts temp
temp = @height * @width
puts temp
