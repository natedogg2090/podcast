class Podcast::CLI

  def call
    list_podcasts
    menu
    goodbye
  end

  def list_podcasts
    puts "welcome to the podcast gem! here is list of podcasts:"
    puts "1. Car Talk - Games & Hobbies"
    puts "2. Fresh Air - Arts"
  end

  def menu
    input = nil

    while input != "exit"
      puts "enter the number for the podcast that you would you like more information, type list to see all the podcasts or type exit:"
      input = gets.strip.downcase
      if input == "1"
        puts "more info on Car Talk"
      elsif input == "2"
        puts "more info on Fresh Air"
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