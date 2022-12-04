Title: A sample article 1
Date: 2022-01-01
Tags: tag1,tag2
Image: post${i}.jpg
Summary: Summary of post 1


## Some content

```ruby
class Item < T::Struct
  extend T::Sig

  const :id, Integer

  private

  sig { returns(String) }
  def do_something
    "hello, world"
  end
end
```