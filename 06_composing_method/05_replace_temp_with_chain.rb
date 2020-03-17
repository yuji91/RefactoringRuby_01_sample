# 6.5 一時変数からチェインへ
# 一時変数を使って式の結果を保存している。
mock = Mock.new
expectation = mock.expects(:a_method_name)
expectation.with("arguments")
expectation.returns([1, :array])
