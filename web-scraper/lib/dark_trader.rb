require 'rubygems'
require 'crack'
require 'open-uri'
require 'rest-client'
require 'nokogiri'

#puts Crack::JSON.parse(RestClient.get(url))

def dark_trader
  page = Nokogiri::HTML(open('https://coinmarketcap.com'))
  value = []
  name = []
  page.xpath('//tr/td[4]/a').each do |v|
    value << v.text.sub('$','')
  end
  page.xpath('//tr/td[2]/div').each do |v|
    name << v.text
  end
  return Hash[name.zip(value)]
end


dark_trader.each { |k,v|
  puts "#{k} => #{v}"
}
