# 6.19 動的レセプタの分離
# 次のサンプルは、すべてのmethod_missing呼び出しを記録するRecorderクラスを示したものである。
class Recorder
  instance_methods.each do |meth|
    undef_method meth unless meth =~/^(__|inspect)/
  end

  def messages
    @messages ||= []
  end

  def method_missing(sym, *args)
    messages << [sym, args]
    self
  end

# Recorderクラスは、「オブジェクトに対するすべてのメッセージを再現する」とか
# 「すべての呼び出しをStringにして表示する」といった新しい機能を必要とすることがある
  def play_for(obj)
    messages.inject(obj) do |result, message|
     result.send message.first, *message.last
    end
  end

  def to_s
    messages.inject([]) do |result, message|
      result << "#{message.first}(args: #{message.last.inspect})"
    end.join(".")
  end
end

# この機能は、次のようにして使う。
class CommandCenter
  def start(command_string)
    self
  end

  def stop(command_string)
    self
  end
end

# クライアントコード
recorder = Recorder.new
recorder.start("LRMMMMRL")
recorder.stop("LRMMMMRL")
recorder.play_for(CommandCenter.new)

# Recorderの機能が増えてくると、明示的に定義されたメッセージから動的に処理されたメッセージを見分けるのが難しくなってくる。
# 設計上、method_missingの機能は、未知のメッセージを処理するはずだが、明示的に定義されたメソッドが追加されてどこかが壊れたときにそれがわかるだろうか。
