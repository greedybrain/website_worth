require "pry"

class WebsiteWorth::User 
  
  attr_reader :name

  # responsible for providing his/her name and the necessary info to scrape
  def initialize 
    @name = gets.chomp
    @name = @name[0].upcase + @name[1..-1].downcase
  end
  
  def self.gives_a_site_name
    while true
      print "Enter the website that you're interested in > (eg. google.com, repl.it, yoursite.net): "
      user_choice = gets.chomp.downcase.to_s
      if user_choice != ("" || nil)
        break
      else
        puts "Please enter a valid website name"
        puts
      end
    end
    user_choice[0].upcase + user_choice[1..-1].downcase
    # binding.pry
  end
  
  def self.search_another_site?
    while true
      puts "Would you like to search another site?"
      user_answer = gets.chomp.downcase.to_s 
      if user_choice != ("" || nil)
        User.gives_a_site_name
      else
        puts "Please type yes or no."
      end
    end
  end

end