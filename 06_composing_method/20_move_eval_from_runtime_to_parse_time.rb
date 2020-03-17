# 6.20 evalを実行時からパース時へ
# evalを使わなければならないが、evalの実行回数を減らしたい。
class Person
  def self.attr_with_default(options)
    options.each_pair do |attribute, default_value|
      define_method attribute do
        eval "@#{attribute} ||= #{default_value}"
      end
    end
  end

  attr_with_default :emails => "[]",
                    :employ_number => "EmployNumberGenerator.next"
end
