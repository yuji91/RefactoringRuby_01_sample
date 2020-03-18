# 6.17 動的メソッド定義 : 動的に定義されたモジュールをextendしてメソッドを定義する
# オブジェクトに対するメソッド呼び出しの処理を単純に他のメソッドに委ねたい場合がある。
# たとえば、Hashのキーと同じ名前のメソッドを呼び出すと、値が取得できるようなHashのデコレータ的なオブジェクトを作りたいものとする。
#
# どのキーが指定されるかがわかっていれば、明示的にデコレータを定義することができる。
class PostData
  def initialize(post_data)
    @post_data = post_data
  end

  def params
    @post_data[:params]
  end

  def session
    @post_data[:session]
  end
end
# このコードは動作するが、Rubyでこんなことをする必要はまったくない。
# また、新しい委譲メソッドを追加したくなったときに、困ることになる。
# Hashに直接委譲するようにmethod_missingを定義することもできないではないが、
# method_missingのデバッグは問題が多いので、可能な限り避けたい。
# 私なら、Hashのキーから動的にメソッドを定義する方向に進む。
# また、PostDataのインスタンスには、異なるHashを渡せるものとしよう。
# そのため、クラス自体でメソッドを定義するのではなく、PostDataの個々のインスタンスごとにメソッドを定義する必要がある。