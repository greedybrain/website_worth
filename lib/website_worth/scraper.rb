class WebsiteWorth::Scraper

  #attributes
  attr_accessor :site_name, :overall_revenue, :rev_daily, :rev_monthly, :rev_yearly, :visits_daily, :visits_monthly, :visits_yearly, :views_daily, :views_monthly, :views_yearly, :alexa_rank, :attri

  # Priority Methods

  def gets_big_name_data
    urls = ["https://www.worthofweb.com/website-value/google/", "https://www.worthofweb.com/website-value/amazon/", "https://www.worthofweb.com/website-value/facebook/", "https://www.worthofweb.com/website-value/youtube/"]
    worth = []
    urls.each do |url|
      worth << Nokogiri::HTML(open(url)).css('div.card-body div.side-left p:nth-of-type(2)')[0].text
    end
    worth
  end

  def get_user_site_data
    get_data_source
    pin_point_data
    print_data
    get_site_attributes
  end

  def get_data_source
    @site_name = WebsiteWorth::User.gives_a_site_name
    @site = Nokogiri::HTML(open("https://www.worthofweb.com/website-value/#{site_name}/"))
  end

  def pin_point_data 
    # ========== Revenue ========== #
    begin
      @overall_revenue = @site.css('div.card-body div.side-left p:nth-of-type(2)')[0].text
    rescue NoMethodError
      puts "Sorry, it seems that the website you entered was invalid"
      WebsiteWorth::CLI.new.call
    end
    @rev_daily = @site.css('div.card-body .col-md-4 p:nth-of-type(2)')[0].text
    @rev_monthly = @site.css('div.card-body .col-md-4 p:nth-of-type(2)')[1].text
    @rev_yearly = @site.css('div.card-body .col-md-4 p:nth-of-type(2)')[2].text
    # ========== Visits ========== #
    @visits_daily = @site.css('div.card-body .col-md-4 p:nth-of-type(2)')[3].text
    @visits_monthly = @site.css('div.card-body .col-md-4 p:nth-of-type(2)')[5].text
    @visits_yearly = @site.css('div.card-body .col-md-4 p:nth-of-type(2)')[7].text
    # ========== Page Views ========== #
    @views_daily = @site.css('div.card-body .col-md-4 p:nth-of-type(2)')[4].text
    @views_monthly = @site.css('div.card-body .col-md-4 p:nth-of-type(2)')[6].text
    @views_yearly = @site.css('div.card-body .col-md-4 p:nth-of-type(2)')[8].text
    # ========== Alexa Rank ========== #
    @alexa_rank = @site.css('div.row')[25].text.gsub(/\R+/, ' ').strip.split[9]
  end

  def print_data
    puts "\n           #{@site_name.upcase}"
    get_site_attributes << @site_name.upcase
    puts
    puts "========== REVENUE =========="
    puts
    puts "===== Overall/ #{@overall_revenue} ====="
    get_site_attributes << @overall_revenue
    puts "===== Daily/ #{@rev_daily} ====="
    get_site_attributes << @rev_daily
    puts "===== Monthly/ #{@rev_monthly} ====="
    get_site_attributes << @rev_monthly
    puts "===== Yearly/ #{@rev_yearly} ====="
    get_site_attributes << @rev_yearly
    puts 
    puts "========== VISITS =========="
    puts
    puts "===== Daily/ #{@visits_daily} ====="
    get_site_attributes << @visits_daily
    puts "===== Monthly/ #{@visits_monthly} ====="
    get_site_attributes << @visits_monthly
    puts "===== Yearly/ #{@visits_yearly} ====="
    get_site_attributes << @visits_yearly
    puts 
    puts "========== PAGE VIEWS =========="
    puts
    puts "===== Daily/ #{@views_daily} ====="
    get_site_attributes << @views_daily
    puts "===== Monthly/ #{@views_monthly} ====="
    get_site_attributes << @views_monthly
    puts "===== Yearly/ #{@views_yearly} ====="
    get_site_attributes << @views_yearly
    puts 
    puts "========== Alexa Rank/ #{@alexa_rank} =========="
    get_site_attributes << @alexa_rank
  end

  def get_site_attributes
    @attri = []
    attri
  end

end
