# 6.10 アルゴリズム変更
# アルゴリズムをもっと分かりやすいものにしたい
# -> メソッド本体を新しいアルゴリズムで書き換える。
def found_friends(people)
  people.select do |person|
    %w(Don John Kent).include? person
  end
end
