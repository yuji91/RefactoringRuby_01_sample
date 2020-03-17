# 6.10 アルゴリズム変更
# アルゴリズムをもっと分かりやすいものにしたい
def found_friends(people)
  friends = []
  people.each do |person|
    if person == "Don"
      friends << "Don"
    end
    if person == "John"
      friends << "John"
    end
    if person == "Kent"
      friends << "Kent"
    end
  end
  return friends
end
