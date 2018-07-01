class Podcast::PodcastScraper

  def self.scrape_npr_directory

    npr_podcasts = []

    doc = Nokogiri::HTML(open("https://www.npr.org/podcasts/organizations/1"))

    doc.css(".item-podcast").each do |podcast|
      podcast_hash = {}

      podcast_hash[:name] = podcast.css("h1.title").text.strip
      podcast_hash[:category] = podcast.css("h2.slug").text
      podcast_hash[:url] = podcast.css("h1.title a").attribute("href").value
      npr_podcasts << podcast_hash  
      
    end

    npr_podcasts
  end

  def self.scrape_npr_podcast(url)

    doc = Nokogiri::HTML(open(url))

    episode_hash = {}

    episode_hash[:description] = doc.css("div.detail-overview-content col2, p").children[0].text.strip
    episode_hash[:date] = doc.css("div.item-info h3.episode-date .date").first.text
    episode_hash[:title] = doc.css("div.item-info h2.title").first.text
    episode_hash[:teaser] = doc.css("p.teaser").first.text.strip.gsub(/\b[A-Z][a-z]{0,9}\b\s(\d|\d\d),\s(\d\d\d\d)\s\W\s/,"")

    episode_hash

  end

end