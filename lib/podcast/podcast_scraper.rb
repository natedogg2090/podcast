require 'open-uri'
# require 'pry'

class Podcast::PodcastScraper
  attr_accessor :name, :category

  def self.scrape_npr_directory
    # return all the podcast instances produced by NPR

    @podcast = []

    doc = Nokogiri::HTML(open("https://www.npr.org/podcasts/organizations/1"))

    doc.css(".item-podcast").each do |podcast|
      podcast_hash = {}

      name = podcast.css("h1.title").text.strip
      category = podcast.css("h2.slug").text
      podcast_hash[:name] = name
      podcast_hash[:category] = category

      @podcast << podcast_hash
    end

    binding.pry

  end

end