require 'open-uri'
# require 'pry'

class Podcast::PodcastScraper
  attr_accessor :name, :category

  def self.scrape_npr_directory

    npr_podcasts = []

    doc = Nokogiri::HTML(open("https://www.npr.org/podcasts/organizations/1"))

    doc.css(".item-podcast").each do |podcast|
      the_podcast = self.new
      the_podcast.name = podcast.css("h1.title").text.strip
      the_podcast.category = podcast.css("h2.slug").text
      npr_podcasts << the_podcast
      
    end

    npr_podcasts
  end

end