class WebsiteWorth::CLI 

  def call 
    intro 
    shows_big_name_data
    # get_site_info # prompts user to choose a site that they're interested in 
    # save_data_to_cpu? # MAYBE feature, prompts user to choose if they want to save data 
  end
  
  def intro
    print "Please enter your name: "
    puts "Hello, #{User.new.name}. Welcome to the Website Worth checker."
    puts "\nBelow is a very short list of some of the most popular websites along with their estimated revenue and traffic data. Take a look!"
    puts "=========================================================="
    puts
  end
  
  def shows_big_name_data
    puts "Google > #{WebsiteWorth::Scraper.gets_big_name_data[0]}"
    puts "Amazon > #{WebsiteWorth::Scraper.gets_big_name_data[1]}"
    puts "Facebook > #{WebsiteWorth::Scraper.gets_big_name_data[2]}"
    puts "Youtube > #{WebsiteWorth::Scraper.gets_big_name_data[3]}"
  end
  
end







