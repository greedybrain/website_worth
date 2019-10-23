class User 
  
  attr_reader :name

  # responsible for providing his/her name and the necessary info to scrape
  def initialize 
    @name = gets.chomp
    @name = @name[0].upcase + @name[1..-1].downcase
  end

end