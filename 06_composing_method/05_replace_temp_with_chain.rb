# 6.5 一時変数からチェインへ
# 一時変数を使って式の結果を保存している。
# -> チェイニングをサポートするようにメソッドを書き換え、一時変数を不変にする。
mock = Mock.new
mock.expects(:a_method_name).with("arguments").returns([1, :array])
