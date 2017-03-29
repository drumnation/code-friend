require '/Users/davidmieloch/dev/learn-live-love/config/environment'
@class_array = ['031317', '0217']

  # ex. ruby-class-variables-and-class-methods-lab-web-031317
  def get_lab_names # returns an array of lab titles
    counter = 0
    lab_names = []
    until counter == 10 do
      hash = RestClient::Request.execute(method: :get, url:"https://api.github.com/search/repositories?q=031317&page=#{counter += 1}", user: '5f3a07dda831a41d5c97ae644d8054f3f8ca99a1')
      # will give us a hash of repositories with 031317
      repo_hash = JSON.parse(hash)
      lab_names += repo_hash["items"].map {|key, val| key["name"]}
    end
    lab_names
  end

  def get_all_lab_pull_urls # returns an array of lab titles
    counter = 0
    completed_pulls = []
    until counter == 10 do
      hash = RestClient::Request.execute(method: :get, url:"https://api.github.com/search/repositories?q=031317&page=#{counter += 1}", user: '5f3a07dda831a41d5c97ae644d8054f3f8ca99a1')
      # will give us a hash of repositories with 031317
      repo_hash = JSON.parse(hash)
      repo_hash["items"].map do |key, val|
         if key["name"]
           key["pulls_url"].split("{")[0]
         end
       end
    end
  end
  
  def get_individual_lab_pull_url(lab_name) # returns an array of lab titles
    counter = 0
    completed_pulls = []
    until counter == 10 do
      hash = RestClient::Request.execute(method: :get, url:"https://api.github.com/search/repositories?q=031317&page=#{counter += 1}", user: '5f3a07dda831a41d5c97ae644d8054f3f8ca99a1')
      # will give us a hash of repositories with 031317
      repo_hash = JSON.parse(hash)
      repo_hash["items"].map do |key, val|
         if key["name"] == lab_name
           key["pulls_url"].split("{")[0]
         end
       end
    end
  end

  # def get_names_from_pull_urls

  # def get_all_lab_pull_urls(individual_pull_url)
  #   all_urls = []
  #   all_urls << individual_pull_url
  #   all_urls
  # end

  puts get_individual_lab_pull_url

  # def get_lab_names # returns an array of lab titles
  #   counter = 0
  #   100.times do
  #     hash = RestClient.get("https://api.github.com/search/repositories?q=#{@class_array[0]}&page=#{counter += 1}")
  #     # will give us a hash of repositories with 031317
  #     repo_hash = JSON.parse(hash)
  #     repo_hash["items"].map {|key, val| key["name"]}
  #   end
  # end

  def get_user_names # returns an array of lab titles
      hashketball = RestClient::Request.execute(method: :get, url:"https://api.github.com/repos/learn-co-students/oo-kickstarter-web-031317/forks", user: '5f3a07dda831a41d5c97ae644d8054f3f8ca99a1')
    # will give us a hash of repositories with 031317
      hashketball_hash = JSON.parse(hashketball)
      hashketball_hash.map {|key, val| key["owner"]["login"] }
  end

  def get_class # returns an array of lab titles
    # counter = 0
    # 10.times do
      hash = RestClient::Request.execute(method: :get, url:"https://api.github.com/search/repositories?q=#{@class_array[0]}", user: '5f3a07dda831a41d5c97ae644d8054f3f8ca99a1')
      # will give us a hash of repositories with 031317
      repo_hash = JSON.parse(hash)
      class_num = repo_hash["items"].map {|key, val| key["name"]}.first.split("-").last
    # end
  end

  def get_user_profile(username)
    user_name_hash = RestClient::Request.execute(method: :get, url:"https://api.github.com/users/#{username}", user: '5f3a07dda831a41d5c97ae644d8054f3f8ca99a1')
    user_name = JSON.parse(user_name_hash)

    user_name.select {|key, val| return val if key == "name" }.values.flatten
  end
  # -----------------------------------------
  # all_user_names = get_user_names.map do |user|
  #   get_user_profile(user)
  # end.compact
  #
  # all_user_names.each {|name| puts name }

  # This stuff above prints out a list of full name strings
  #-------------------------------------------------------

  def fill_lab_name_column
    get_lab_names.each do |lab|
      Lab.create(lab_name_display: lab)
    end
  end
# p get_user_names
# p get_user_profile(get_user_names)
# p get_class
# get_lab_names
