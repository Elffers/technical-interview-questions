require 'nokogiri'
require 'uri'
require 'open-uri'

class Scraper
  attr_accessor :map

  # Add url as argument in initialize and enqueue it so as to not have to
  # 'prime the pump' by calling parse once first before populate
  def initialize
    @map = {}
    @queue = []
  end

  def parse(url)
    doc = Nokogiri::HTML open(url)
    links = doc / "a"
    links = links.map { |link|
      url + link.attributes["href"].value if link.attributes.include? "href"}
    @map[url] = links
    @queue.concat links
  end

  def populate
    @queue.each do |link|
      if !@map.include? link
        parse link
      end
    end
  end
end

s = Scraper.new
s.parse(URI("http://hhh-sinatra.herokuapp.com/blog"))
s.populate
puts s.map
