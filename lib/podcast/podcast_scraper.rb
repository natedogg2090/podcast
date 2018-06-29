# require 'open-uri'
# require 'pry'

class Podcast::PodcastScraper
  attr_accessor :name, :category

  def self.scrape_index
    # return all the podcast instances produced by NPR
    # puts "1. Car Talk - Games & Hobbies"
    # puts "2. Fresh Air - Arts"

    @podcast = []

    podcast_1 = self.new
    podcast_1.name = "Car Talk"
    podcast_1.category = "Games & Hobbies"

    podcast_2 = self.new
    podcast_2.name = "Fresh Air"
    podcast_2.category = "Arts"

    @podcast << podcast_1
    @podcast << podcast_2
  end

end