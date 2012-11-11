--Variables are global in Lua by default
--like in JS, you use a keyword to limit to the current scope

local io   = require('io') --get an IO object from the stdlib
local http = require('socket.http') --from LuaSocket library installed via luarocks

print("Whose Twitter feed do you want to retrieve?")
local username = io.read() -- read from stdin like Ruby's "gets"

--now we'll make a request to Twitter
local url = "http://twitter.com/"..username
print("Sending request to "..url.."...")

--response contains entire response body
--when you use it in this simple way
local response = http.request(url)

print("Got it.  Do you want to print it to the console?")

local pref = io.read()

-- pattern-match for 'Y' or 'y' in response
if string.find(pref, '[Yy]') ~= nil then
  print(response)
else
  print("OK then, be that way.")
end

