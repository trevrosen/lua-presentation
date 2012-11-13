-- In Lua, we can act on an object defined in another context,
-- because everything is global by default.

-- Start an interactive Lua session in this directory and input the following:
-- dofile('foobaricus.lua')

-- unless the expression is true, an error is raised
assert(foobaricus, "you must have a 'foobaricus' table in your environment")

foobaricus.fun()

foobaricus.zanzibar = function (name)
  print("We are taking "..name.." to Zanzibar")
end


