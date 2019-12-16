## Refactoring RubyEdition

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
