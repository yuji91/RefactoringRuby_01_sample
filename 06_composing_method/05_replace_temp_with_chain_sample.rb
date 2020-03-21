# 6.5 一時変数からチェインへ : サンプル
# HTML要素を作成するライブラリを設計しているものとする。
# このライブラリには、選択用のドロップダウンリストを作り、選択肢を追加できるメソッドが追加されることになっている。
# 次のコードは、サンプルHTMLを作成できるようにするSelectクラスと、Selectクラスの使用例である。
# メソッドのチェイン呼び出しを実現するための第1歩は、Selectのインスタンスを作ってオプションを追加するメソッドを作ることだ。
# 次に、オプションを追加するメソッドを書き換えて、selfを返すようにし、チェイニングできるようにする。
# 最後に、チェイニングしたときに流れるように(fluentに)読めるように add_option メソッドの名前を変える。たとえば、and などがよいだろう。
class Select
  def self.with_option(option)
    select = self.new
    select.options << option
    select
  end

  def options
    @options ||= []
  end

  def and(arg)
    options << arg
    self
  end
end

=begin
select = Select.with_option(1999).and(2000).and(2001).and(2002)
select # => #<Select: 0x28708 @options=[1999, 2000, 2001, 2002]>
