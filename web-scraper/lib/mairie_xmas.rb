require 'rubygems'
require 'crack'
require 'open-uri'
require 'rest-client'
require 'nokogiri'

puts "-------------------------".center(60)
puts "This program might take long to run".center(60)
puts "Be patient, it might take up to 2 minutes".center(60)
puts "-------------------------".center(60)

def get_url(page)
  urls = []
  page = Nokogiri::HTML(open(page))
  page.css('a.lientxt').collect do |url|
    town = url.attribute('href').value.sub('./','')
    urls << 'https://www.annuaire-des-mairies.com/'.concat(town)
  end
  return urls
end

def get_email(town_urls)
  emails = []
  town_names = []
  town_urls.each { |url|
    page = Nokogiri::HTML(open(url))
    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |v|
      emails << v.text
      town = url.sub('https://www.annuaire-des-mairies.com/95/','').sub('.html','').upcase
      town_names << town
    end
  }
  return Hash[town_names.zip(emails)]
end

urls = get_url('https://www.annuaire-des-mairies.com/val-d-oise.html')

get_email(urls).each { |k,v|
  puts "#{k} => #{v}"
}
