# encoding: utf-8

require_relative 'twitterrubylib'
require 'cgi'
require 'net/http'
require 'kconv'

def GetMP3File(user, num)

address = 'translate.google.com'

a = GetTwitterRss(user)

if (a.length < 1)
  raise "id is not found"
end

i = 1
result = Net::HTTP.start(address, 80){|http|
  a.each {|v|
    if (i != num)
      i = i + 1
      next
    end
    voice = CGI.escape(v)
    response = http.get('/translate_tts?q=' + voice + 
'&tl=ja&prev=input',{'User-Agent' => 'Mozilla/5.5'})
    return response
    #filename = user + i.to_s + 'test.mp3'
    #File.open( filename, "w" ) do |file|
    #  file.puts response
    #end
  }
}

end
