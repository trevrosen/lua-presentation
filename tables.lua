-- The "table" is the compound data structure of Lua.
-- They have properties of both hashes and arrays in Ruby.
-- The syntax looks a lot like Javascript objects

foo = {
  name = "A glorious Foo"
}

foo.bar = "bar string, yo"

bar = {
   "another string"
}

print(foo)     -- gives the memory address
print(foo.name) -- gives the string we put at that key
print(foo.bar) -- gives the string we put at that key

print(bar[1]) -- arrays start w/ 1 in Lua(!)   (( http://www.luafaq.org/index.html#T1.5.1 ))