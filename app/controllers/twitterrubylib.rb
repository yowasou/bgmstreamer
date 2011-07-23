require 'cgi'
require 'net/http'
require 'rexml/document'

def GetTwitterRss(user)
address = 'twitter.com'
a = []
result = Net::HTTP.start(address, 80){|http|
  response = http.get('/statuses/user_timeline/' + user + '.rss')
  doc = REXML::Document.new response.body
  doc.elements.each("rss/channel/item/title"){|element|
    a.push element.text
  }
}
return a
end

