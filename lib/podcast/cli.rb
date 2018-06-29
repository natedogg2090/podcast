class Podcast::CLI

  def call
    list_podcasts
    menu
    goodbye
  end

  def list_podcasts
    puts "welcome to the podcast gem! here is list of podcasts:"
    @podcast = Podcast::PodcastScraper.scrape_index
    @podcast.each.with_index(1) do |podcast, i|
      puts "#{i}. #{podcast.name} - #{podcast.category}"
    end
  end

  def menu
    input = nil

    while input != "exit"
      puts "enter the number for the podcast that you would you like more information, type list to see all the podcasts or type exit:"
      input = gets.strip.downcase
      if input.to_i > 0
        puts @podcast[input.to_i - 1]
      elsif input == "list"
        list_podcasts
      else
        puts "invalid input. type list or exit"
      end
    end
  end

  def goodbye
    puts "see you later"
  end

end