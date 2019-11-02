require 'csv'
class WebsiteWorth::CLI 

  # MAIN METHOD
  def call 
    list_users_site_info
    another?
  end
  
  # Priority Methods
  
  def intro
    time = Time.now
    print "\nPlease enter your name: "
    name = gets.chomp
    puts "\nHello, #{WebsiteWorth::User.new(name).name}. Welcome to the Website Worth checker."
    puts "\nBelow is a very short list of some of the most popular websites along with their estimated revenue and traffic data as of #{get_date_and_time}, Take a look!"
    puts "=========================================================="
    puts
  end
  
  def shows_big_name_data
    scraper_object = WebsiteWorth::Scraper.new
    revenue_data = scraper_object.gets_big_name_data
    # binding.pry
    puts "Google > #{revenue_data[0]}"
    puts "Amazon > #{revenue_data[1]}"
    puts "Facebook > #{revenue_data[2]}"
    puts "Youtube > #{revenue_data[3]}"
    puts
  end

  # WILLIS 
  
  def list_users_site_info
    print "\nEnter the website that you're interested in > (eg. google.com, repl.it, yoursite.net): "
    scraper_object = WebsiteWorth::Scraper.new 
    scraper_object.get_user_site_data
    # WebsiteWorth::Scraper.prep_for_csv
  end

  def another?
    yes_no = nil
    while yes_no != 'n'
      print "\nWould you like to try another site?(y/n) or (Ctrl+C[Windows Users] or Control+C[Mac Users]) to exit: "
      yes_no = gets.chomp.to_s.downcase
      if yes_no == "y"
        list_users_site_info  
      elsif yes_no != 'y' || yes_no != 'n'
        next
      elsif yes_no == ""
        next
      else
        exit!
      end
    end
  end
  
  # Supplement Methods
  
  def get_date_and_time
    time = Time.now 
    months = ["January", "February", "March", "April", "May", "June", "July", "August","September", "October", "November","December"]
    days = ["Sunday", "Monday", "Tuesday", "Wednesday" ,"Thursday", "Friday", "Saturday"]
    "#{days[time.wday]}, #{months[time.month - 1]} #{time.day}, #{time.year}."
  end
  
end







