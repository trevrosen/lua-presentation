-- Sample Nmap Scripting Engine (NSE) script
-- Finds Rails applications and prints their title element contents

description = [[ Find machines running Rails apps in dev mode and report on the title of their app ]]

categories = {"safe", "discovery"}

require 'stdnse'
require 'http'

--Only act on std Rails dev port
function portrule(host, port)
  return port.number == 3000
end

function action(host, port)
  local response, app_title
  response = http.get(host, port, "/")

  if response.status and response.status ~= 404 then
    app_title = title_from_body(response.body)
    return "'"..app_title.."'"
  end
end

-- Grab the extracted title from the HTML in the response body
function title_from_body(body)
  return string.match(body,"<title>(.+)</title>")
end