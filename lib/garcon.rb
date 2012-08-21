require 'garcon/garmin_activity'
require 'mechanize'
require 'json'

class Garcon
  VERSION = '0.0.1'
    
  def initialize(username, password)
    @username = username
    @password = password
  end
  
  def login    
    @agent = Mechanize.new
    login_page = @agent.get('https://connect.garmin.com/signin')
    form = login_page.form('login')
    form['login:loginUsernameField'] = @username
    form['login:password'] = @password
    
    page = @agent.submit(form, form.buttons.first)
    success = page.inspect =~ /Dashboard for/ ? true : false
    puts "Login of user '#{@username}' #{success ? "successful" : "failed"}."
    success
  end
          
  def activities
    @activities = []

    puts "Getting list of activities..."
    
    # get a list of all activities
    activitiy_json = @agent.get('https://connect.garmin.com/proxy/activity-search-service-1.1/json/activities?limit=100')
    results = JSON.parse(activitiy_json.body)["results"]
    
    # determine number of pages
    pages = results["search"]["totalPages"]
    puts "Reading #{results["search"]["totalFound"]} activities."
    
    # iterate over all pages to get a list of all activities
    (1..pages.to_i).each do |i|
      activitiy_json = @agent.get("https://connect.garmin.com/proxy/activity-search-service-1.1/json/activities?currentPage=#{i}&limit=100")
      results = JSON.parse(activitiy_json.body)["results"]
      results["activities"].each do |a|
        @activities << GarminActivity.new(a["activity"])
      end
    end
  
    @activities
  end
  
end