require 'open-uri'
# require 'pry'

class Podcast::PodcastScraper
  attr_accessor :name, :category, :url, :description, :date, :title, :teaser

  def self.scrape_npr_directory

    npr_podcasts = []

    doc = Nokogiri::HTML(open("https://www.npr.org/podcasts/organizations/1"))

    doc.css(".item-podcast").each do |podcast|

      the_podcast = self.new
      the_podcast.name = podcast.css("h1.title").text.strip
      the_podcast.category = podcast.css("h2.slug").text
      the_podcast.url = podcast.css("h1.title a").attribute("href").value
      npr_podcasts << the_podcast
      
    end

    npr_podcasts
  end

  def self.scrape_npr_podcast(url)

    doc = Nokogiri::HTML(open(url))

    episode_hash = {}

    episode_hash[:description] = doc.css("div.detail-overview-content col2, p").children[0].text
    episode_hash[:date] = doc.css("div.item-info h3.episode-date .date").first.text
    episode_hash[:title] = doc.css("div.item-info h2.title").first.text
    episode_hash[:teaser] = doc.css("div.item-info p.teaser").first.text

    episode_hash

  end

end