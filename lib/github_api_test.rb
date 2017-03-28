require_relative '../config/environment'

class_repo_hash = RestClient.get('https://api.github.com/search/repositories?q=031317')
