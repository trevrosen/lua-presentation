--
--
--
--
--
--  you realize that looking at this early is cheating, right?
--
--
--
--
--
--
--
--  fine.  just as long as you realize.
--
--
--
--
--
-- A Lua implementation of the credit card check quiz
-- http://www.rubyquiz.com/quiz122.html

CreditCard = {}
CreditCard.card_stats = {
  AMEX = {
    valid_prefixes = {34,37},
    length = 15
  },

  Discover = {
    valid_prefixes = {6011},
    length = 16
  },

  MC = {
    valid_prefixes = {51,52,53,54,55},
    length = 16
  },

  Visa = {
    valid_prefixes = {4},
    length = {13,16}
  }
}

function CreditCard:new(number)
  assert(type(number) == "string", "Number must be entered as a string")
  local cc = {}
  cc.number = number
  setmetatable(cc, self) 
  self.__index = self
  return cc
end

function CreditCard:validate()
  print(self.number)

  if self:prefix_is_valid()
    and self:size_is_valid()
    and self:checksum_is_valid()
  then
    return true
  else
    return false
  end
end

function CreditCard:checksum_is_valid()

  return true
end

function CreditCard:size_is_valid()
  cc_type         = self:get_type()
  num_length      = self.number:len()
  length_for_type = CreditCard.card_stats[cc_type].length
  
  if cc_type == "Visa" then
    for _,length in pairs(type_length) do
      if length == self.number:len() then
        return true
      end
    end
    return false -- prefix says Visa but size is invalid
  else
    return num_length == length_for_type
  end
end

function CreditCard:prefix_is_valid()
  prefix  = self:get_prefix()
  cc_type = self:get_type()
  
  -- There's no equivalent of Array#include?... :-(
  for _, p in pairs(CreditCard.card_stats[cc_type].valid_prefixes) do
    if p == tonumber(prefix) then 
      return true
    end
  end
  return false
end

  -- Return the type of the card
function CreditCard:get_type()
  first_digit = self.number:sub(1,1) -- same as string.sub(cc,1,1)
  
  if first_digit == "3" then
    return "Amex"
  elseif first_digit == "4" then
    return "Visa"
  elseif first_digit == "5" then
    return "MC"
  elseif first_digit == "6" then
    return "Discover"
  else
    error("Invalid first digit: "..first_digit)
  end
end

-- Return the prefix of the card
function CreditCard:get_prefix()
  cc_type = self:get_type()
    
  local prefix_size 
  if cc_type == "Discover" then
    prefix_size = 4
  elseif cc_type == "Visa" then
    prefix_size = 1
  else
    prefix_size = 2
  end

  return self.number:sub(1,prefix_size)
end





test_number = "5491030012336655"
card = CreditCard:new(test_number)

print(card:validate())



