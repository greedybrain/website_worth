require 'pry'

class WebsiteWorth::CLI 

  def call 
    intro # Hello (name), welcome to website worth checker. 
    shows_ex_big_names # Shows user a list of big names and there worth 
    get_site_info # prompts user to choose a site that they're interested in 
    save_data_to_cpu? # MAYBE feature, prompts user to choose if they want to save data 
  end
  
  def intro
    # get name by accessing user class
    puts "Hello #{}"
  end
  

end







