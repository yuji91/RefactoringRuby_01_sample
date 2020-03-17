# 6.17 動的メソッド定義 : instance_execメソッド
[:failure, :error, :success].each do |method|
  define_method method do
    self.state = method
  end
end

# ループ内でメソッドを動的に定義すれば、確かに定義が簡潔になるが、これはあまり読みやすいコードだとは言えない。
# この問題に対処するために、def_eachメソッドを定義する。
# def_eachメソッドを定義すると、ソースコード内で動的定義に気付きやすくなり、していることの意味も理解しやすくなる。
class  Class
  def def_each(*method_names, &block)
    method_names.each do |method_name|
      define_method method_name do
        instance_exec method_name, &block
      end
    end
  end
end

# Ruby1.9はデフォルトでinstance_execメソッドを持っているが、Ruby1.8にはそのような機能はない。
# この問題に対処するために、Mauricio Fernandezが作った次のコードをincludeするようにしている。
class Object
  module InstanceExecHelper; end
  include InstanceExecHelper
  def instance_exec(*args, &block)
    begin
      old_critical, Thread.critical = Thread.critical, true
      n = 0
      n += 1 while respond_to?(mname="__instance_exec#{n}")
      InstanceExecHelper.module_eval{ define_method(mname, &block) }
    ensure
      Thread.critical = old_critical
    end
    begin
      ret = send(mname, *args)
    ensure
      InstanceExecHelper.module_eval{ remove_method(mname) } rescue all
    end
    ret
  end
end
