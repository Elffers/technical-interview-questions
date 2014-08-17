require 'nokogiri'
require 'uri'
require 'open-uri'

class Scraper
  attr_accessor :map

  def initialize
    @map = {}
    @queue = []
  end

  def parse(url)
    doc = Nokogiri::HTML open(url)
    links = doc / "a"
    links = links.map { |link|
      puts link;
      url + link.attributes["href"].value if link.attributes.include? "href"}
    @map[url] = links
    @queue.concat links
  end

  def populate
    @queue.each do |link|
      if !@map.include? link
        p link
        parse link
      end
    end
  end
end

s = Scraper.new
s.parse(URI("http://hhh-sinatra.herokuapp.com/blog"))
s.populate
puts s.map
