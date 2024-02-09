## Refactoring RubyEdition

### link
[06_composing_method](https://github.com/yuji91/RefactoringRuby_01_sample/tree/feature/06_composing_method_after/06_composing_method)

### Getting Started
```ruby
ruby -v # 2.6.5
irb
require './main.rb'
load './main.rb'
```
### notes
```
[misprint] customer.rb#L37
 if element.movie.price_code == Movie.NEW_RELEASE && element.days_rented > 1
 if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
 ```
