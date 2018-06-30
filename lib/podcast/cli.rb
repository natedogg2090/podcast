class Podcast::CLI

  def call
    list_podcasts
    menu
  end

  def list_podcasts
    puts "Welcome to my podcast gem!"
    puts ""
    puts "Here is list of NPR podcasts:"
    @podcast = Podcast::PodcastScraper.scrape_npr_directory
    @podcast.each.with_index(1) do |podcast, i|
      puts "#{i}. #{podcast.name} - #{podcast.category}"
    end
  end

  def menu
    input = nil

    while input != "exit"
      puts ""
      puts "Enter the number for the podcast that you would you like more information, type 'list' to see all the podcasts or type 'exit':"
      input = gets.strip.downcase
      if input.to_i > 0
        podcast_details(input)
      elsif input == "list"
        list_podcasts
      elsif input == "exit"
        goodbye
      else
        puts "Invalid input. Please enter a valid number, type 'list' for the list of podcasts or type 'exit'"
      end
    end
  end

  def podcast_details(input)
    the_podcast = @podcast[input.to_i - 1]
    details = Podcast::PodcastScraper.scrape_npr_podcast(the_podcast.url)
        puts "----------------------".colorize(:green)
        puts "#{the_podcast.name.upcase}".colorize(:blue)
        puts "#{the_podcast.category}"
        puts ""
        puts "Description: " + "#{details[:description]}"
        puts ""
        puts "Latest Episode: " + "#{details[:title]}"
        puts "Date: " + "#{details[:date]}"
        puts "Episode Teaser:" + " #{details[:teaser]}"
        puts "----------------------".colorize(:green)

  end

  def goodbye
    puts ""
    puts "See you next time."
    puts ""
  end

end