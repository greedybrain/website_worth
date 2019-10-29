class WebsiteWorth::User
  
  attr_reader :name

  # responsible for providing his/her name and the necessary info to scrape
  def initialize
    begin
      @name = gets.chomp.to_s
      @name = @name[0].upcase + @name[1..-1].downcase
    rescue 
      @name = "User"
    end
  end
  
  def self.gives_a_site_name
    while true
      user_choice = gets.chomp.downcase.to_s
      if user_choice == ""
        print "\nPlease enter a valid website name: "
        next
      else
        break
      end
    end
    user_choice
  end

end
