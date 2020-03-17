# 6.7 説明用変数の導入 : サンプル
# このサンプルでは、ハギス(スコットランドの伝統料理)の移動距離を計算する。
# ハギスは静止しているが、最初の力を受けて移動を開始する。
# しばらくすると、第2の力を受けてハギスに加速が付く。
# 運動の一般法則を使えば、ハギスの移動距離は次のように計算できる。
def distance_traveled(time)
  acc = @primary_force / @mass
  primary_time = [time, @delay].min
  result = 0.5 * acc * primary_time * primary_time
  secondary_time = time - @delay
  if (secondary_time > 0)
    primary_vel = acc * @delay
    acc = (@primary_force + @secondary_force) / @mass
    result += primary_vel * secondary_time + 5 * acc * secondary_time * secondary_time
  end
end
# リファクタリングには格好の関数だが、「一時変数の分割」という観点からは、acc変数が2度設定されていることに注目しよう。
# acc変数は2つの仕事を持っている。
# 最初の力を受けた結果得た最初の加速度を保存することと、2つの力を受けた後の加速度を保存することである。
# そこで、この2つを分割する。
