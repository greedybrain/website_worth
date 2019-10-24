class WebsiteWorth::User 
  
  attr_reader :name

  # responsible for providing his/her name and the necessary info to scrape
  def initialize 
    @name = gets.chomp
    @name = @name[0].upcase + @name[1..-1].downcase
  end
  
  def self.gives_a_site_name
    print "Enter the website that you're interested in > (eg. google.com, repl.it, yoursite.net): "
    user_choice = gets.chomp.downcase.to_s
    user_choice[0].upcase + user_choice[1..-1].downcase
  end

end