require '../config/environment'
@class_array = ['031317', '0217']

  # ex. ruby-class-variables-and-class-methods-lab-web-031317
  def get_lab_names # returns an array of lab titles
    counter = 0
    lab_names = []
    until counter == 10 do
      hash = RestClient::Request.execute(method: :get, url:"https://api.github.com/search/repositories?q=031317&page=#{counter += 1}", user: 'ccaa22e8958913faab90e0cf9c9b8a827c0bc900')
      # will give us a hash of repositories with 031317
      repo_hash = JSON.parse(hash)
      lab_names += repo_hash["items"].map {|key, val| key["name"]}
    end
    lab_names
  end

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
      hashketball = RestClient::Request.execute(method: :get, url:"https://api.github.com/repos/learn-co-students/oo-kickstarter-web-031317/forks", user: '75aad1cd9a496c8c248796dcfcd1fb4dc039c48b')
    # will give us a hash of repositories with 031317
      hashketball_hash = JSON.parse(hashketball)
      hashketball_hash.map {|key, val| key["owner"]["login"] }
  end

  def get_class # returns an array of lab titles
    # counter = 0
    # 10.times do
      hash = RestClient::Request.execute(method: :get, url:"https://api.github.com/search/repositories?q=#{@class_array[0]}", user: '75aad1cd9a496c8c248796dcfcd1fb4dc039c48b')
      # will give us a hash of repositories with 031317
      repo_hash = JSON.parse(hash)
      class_num = repo_hash["items"].map {|key, val| key["name"]}.first.split("-").last
    # end
  end

  def get_user_profile(username)
    user_name_hash = RestClient::Request.execute(method: :get, url:"https://api.github.com/users/#{username}", user: '75aad1cd9a496c8c248796dcfcd1fb4dc039c48b')
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


# p get_user_names
# p get_class
get_lab_names
