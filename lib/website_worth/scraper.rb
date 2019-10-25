class WebsiteWorth::Scraper
  
  # Priority Methods

  def self.gets_big_name_data
    urls = ["https://www.worthofweb.com/website-value/google/", "https://www.worthofweb.com/website-value/amazon/", "https://www.worthofweb.com/website-value/facebook/", "https://www.worthofweb.com/website-value/youtube/"]
    worth = []
    urls.each do |url|
      worth << Nokogiri::HTML(open(url)).css('div.card-body div.side-left p:nth-of-type(2)')[0].text
    end
    worth
  end
  
  def self.get_user_site_data
    site_name = WebsiteWorth::User.gives_a_site_name
    site = Nokogiri::HTML(open("https://www.worthofweb.com/website-value/#{site_name}/"))
    # ========== Revenue ========== #
    overall_revenue = site.css('div.card-body div.side-left p:nth-of-type(2)')[0].text
    rev_daily = site.css('div.card-body .col-md-4 p:nth-of-type(2)')[0].text
    rev_monthly = site.css('div.card-body .col-md-4 p:nth-of-type(2)')[1].text
    rev_yearly = site.css('div.card-body .col-md-4 p:nth-of-type(2)')[2].text
    
    # ========== Visits ========== #
    visits_daily = site.css('div.card-body .col-md-4 p:nth-of-type(2)')[3].text
    visits_monthly = site.css('div.card-body .col-md-4 p:nth-of-type(2)')[5].text
    visits_yearly = site.css('div.card-body .col-md-4 p:nth-of-type(2)')[7].text
    
    # ========== Page Views ========== #
    views_daily = site.css('div.card-body .col-md-4 p:nth-of-type(2)')[4].text
    views_monthly = site.css('div.card-body .col-md-4 p:nth-of-type(2)')[6].text
    views_yearly = site.css('div.card-body .col-md-4 p:nth-of-type(2)')[8].text
    
    # ========== Alexa Rank ========== #
    alexa_rank = site.css('div.row')[25].text.gsub(/\R+/, ' ').strip
    alexa_rank = alexa_rank[alexa_rank.index(':') + 2].to_i
    
    puts
    puts "           #{site_name}"
    puts
    puts "========== REVENUE =========="
    puts
    puts "===== Overall/ #{overall_revenue} ====="
    puts "===== Daily/ #{rev_daily} ====="
    puts "===== Monthly/ #{rev_monthly} ====="
    puts "===== Yearly/ #{rev_yearly} ====="
    puts 
    puts "========== VISITS =========="
    puts
    puts "===== Daily/ #{visits_daily} ====="
    puts "===== Monthly/ #{visits_monthly} ====="
    puts "===== Yearly/ #{visits_yearly} ====="
    puts 
    puts "========== PAGE VIEWS =========="
    puts
    puts "===== Daily/ #{views_daily} ====="
    puts "===== Monthly/ #{views_monthly} ====="
    puts "===== Yearly/ #{views_yearly} ====="
    puts 
    puts "===== Alexa Ranking/ #{alex_rank} ====="
    
  end
  
end









