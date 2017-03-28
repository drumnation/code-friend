require '/Users/davidmieloch/dev/learn-live-love/config/environment'
@class_array = ['031317', '0217']

  # ex. ruby-class-variables-and-class-methods-lab-web-031317
  def get_lab_names # returns an array of lab titles
    counter = 0
    100.times do
      hash = RestClient.get("https://api.github.com/search/repositories?q=#{@class_array[0]}&page=#{counter += 1}")
      # will give us a hash of repositories with 031317
      repo_hash = JSON.parse(hash)
      puts repo_hash["items"].map {|key, val| key["name"]}
    end
  end

  def get_user_names # returns an array of lab titles
    3.times do
      hashketball = RestClient.get("https://api.github.com/repos/learn-co-students/advanced-hashes-hashketball-web-031317/pulls")
    # will give us a hash of repositories with 031317
      hashketball_hash = JSON.parse(hashketball)
      p hashketball_hash.map {|key, val| binding.pry key["user"] }
    end
  end
get_user_names
# get_lab_names
