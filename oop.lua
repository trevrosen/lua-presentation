--tables are objects
Account = {
  balance = 0 --this works like an attribute
}

function Account.withdraw(amt)
end

Account.withdraw(59)

print(Account.balance)

--But this is dumb.  Let's make it more object-oriented:


-- same as saying: function Account.new(self, o)
-- the ':' character provides a shorthand for passing in "self"
-- lovely!  why doesn't Python do this? :-)
function Account:new (o)
  o = o or {}   -- create object if user does not provide one
  setmetatable(o, self)
  self.__index = self
  return o
end

-- This is reminiscent of the way that it works in JS
-- to make a constructor, default values for attributes, etc
