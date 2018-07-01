class Podcast::Podcast
  attr_accessor :name, :category, :url, :description, :date, :title, :teaser

  @@all = []

    def initialize(episode_hash)
      episode_hash.each do |attribute, value|
        self.send "#{attribute}=", value
      end
      @@all << self

    end

    def self.create_from_collection(npr_podcasts)
      npr_podcasts.each do |podcast|
        self.new(podcast)
      end

    end

    def add_podcast_attributes(episode_hash)
      episode_hash.each do |attribute, value|
        self.send "#{attribute}=", value
      end
      self
    end

    def self.all
      @@all
    end

end
