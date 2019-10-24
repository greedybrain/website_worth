class WebsiteWorth::CLI 
  
  # MAIN METHOD

  def call 
    intro 
    shows_big_name_data
    # list_site_info # prompts user to choose a site that they're interested in 
    # save_data_to_cpu? # MAYBE feature, prompts user to choose if they want to save data 
  end
  
  # Priority Methods
  
  def intro
    time = Time.now
    print "Please enter your name: "
    puts "Hello, #{Website::User.new.name}. Welcome to the Website Worth checker."
    puts "\nBelow is a very short list of some of the most popular websites along with theirestimated revenue and traffic data as of #{get_date_and_time}. Take a look!"
    puts "=========================================================="
    puts
  end
  
  def shows_big_name_data
    revenue_data = WebsiteWorth::Scraper.gets_big_name_data
    puts "Google > #{revenue_data[0]}"
    puts "Amazon > #{revenue_data[1]}"
    puts "Facebook > #{revenue_data[2]}"
    puts "Youtube > #{revenue_data[3]}"
  end
  
  # Supplement Methods
  
  def get_date_and_time
    time = Time.now 
    months = ["January", "February", "March", "April", "May", "June", "July", "August","September", "October", "November","December"]
    days = ["Sunday", "Monday", "Tuesday", "Wednesday" ,"Thursday", "Friday", "Saturday"]
    "#{days[time.wday]}, #{months[time.month - 1]} #{time.day}, #{time.year} at #{time.hour - 4}:#{time.min}"
  end
  
end







