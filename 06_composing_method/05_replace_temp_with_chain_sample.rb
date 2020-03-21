# 6.5 一時変数からチェインへ : サンプル
# HTML要素を作成するライブラリを設計しているものとする。
# このライブラリには、選択用のドロップダウンリストを作り、選択肢を追加できるメソッドが追加されることになっている。
# 次のコードは、サンプルHTMLを作成できるようにするSelectクラスと、Selectクラスの使用例である。
# メソッドのチェイン呼び出しを実現するための第1歩は、Selectのインスタンスを作ってオプションを追加するメソッドを作ることだ。
class Select
  def self.with_option(option)
    select = self.new
    select.options << option
    select
  end

  def options
    @options ||= []
  end

  def add_option(arg)
    options << arg
  end
end

=begin
select = Select.with_option(1999)
select.add_option(2000)
select.add_option(2001)
select.add_option(2002)
select # => #<Select: 0x28708 @options=[1999, 2000, 2001, 2002]>
