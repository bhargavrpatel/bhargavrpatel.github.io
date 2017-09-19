---
title:  "Pattern Matching in Elixir"
date:   2016-09-01 10:18:00
description: Basics in Pattern Matching
---

```ruby
iex> a = 1
1
iex> a = 2
2
iex> a
2
```

In Elxiir, `=` is not the typical equals sign but rather is a match operator. However, if that is the case, why were we able to match 1 = 2? That is because in Elixir, even though the datat types are immutable, variable names are not. When the match fails, the variable name will be ressigned to the *data* stored at the newer memory location, in this case the value will be 2.

This can be avoided with e caret character as shown below:

```ruby
iex> a = 1
1
iex> ^a = 2
** (MachError) no match of right hand side value: 2
```

### Example usage

Pattern matching has many benefits. Predominantly, it is used to compare output of functions in combination with atoms like shown below:

```ruby
{:ok, result} = foo()  # foo returns a tuple with :ok and result
```

When the output of foo is invalid, the fucntion would not return the atom, `:ok` and thus resulting in an assertion failure.

When the output of a function is an iterable like the tuple shown above, pattern matching can be leveraged to create multiple variables at once like shown below:

```ruby
iex> [a, b, c] = ["first", "second", [:internal, :list, :here]]
["first", "second", :third]
iex> a
"first"
iex> c
[:internal, :list, :here]
```

Similar to Python, it is possible to ignore values using `_`. Refer to example below:

```ruby
iex> [a, _, _] = [1, 2, 3]
[1, 2, 3]
iex> a
1
```
