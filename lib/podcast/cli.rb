class Podcast::CLI

  def call
    make_podcasts
    list_podcasts
    add_attributes_to_podcast
    menu
  end

  def make_podcasts
    podcasts = Podcast::PodcastScraper.scrape_npr_directory
    Podcast::Podcast.create_from_collection(podcasts)
  end

  def add_attributes_to_podcast
    Podcast::Podcast.all.each do |podcast|
      attributes = Podcast::PodcastScraper.scrape_npr_podcast(podcast.url)
      podcast.add_podcast_attributes(attributes)
    end
  end

  def list_podcasts
    puts "Welcome to my podcast gem!"
    puts ""
    puts "Here is list of NPR podcasts:"
    Podcast::Podcast.all.each.with_index(1) do |podcast, i|
      puts "#{i}. #{podcast.name} - #{podcast.category}"
    end
  end

  def menu
    input = nil
    podcast_count = Podcast::Podcast.all.count

    while input != "exit"
      puts ""
      puts "Enter the number for the podcast that you would you like more information, type 'list' to see all the podcasts or type 'exit':"
      input = gets.strip.downcase
      if input.to_i.between?(1, podcast_count)
        display_podcast_details(input)
      elsif input == "list"
        list_podcasts
      elsif input == "exit"
        goodbye
      else
        puts "Invalid input. Please enter a valid number, type 'list' for the list of podcasts or type 'exit'"
      end
    end
  end

  def display_podcast_details(input)
    podcast = Podcast::Podcast.all[input.to_i - 1]
    puts "----------------------".colorize(:green)
    puts "#{podcast.name.upcase}".colorize(:blue)
    puts "#{podcast.category}".colorize(:yellow)
    puts ""
    puts "Description: " + "#{podcast.description}"
    puts ""
    puts "Latest Episode Title: " + "#{podcast.title}"
    puts "Date: " + "#{podcast.date}"
    puts "Episode Teaser:" + " #{podcast.teaser}"
    puts "----------------------".colorize(:green)

  end

  def goodbye
    puts ""
    puts "See you next time."
    puts ""
  end

end