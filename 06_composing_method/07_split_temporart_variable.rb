# 6.7 一時変数の分割
# ループ変数でも計算結果の蓄積用の変数でもないのに、複数回代入される一時変数がある。
# -> 代入ごとに別々の一時変数を用意する。
perimeter = 2 * (@height + @width)
puts perimeter
area = @height * @width
puts area
