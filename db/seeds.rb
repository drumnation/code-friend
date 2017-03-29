require '/Users/davidmieloch/dev/learn-live-love/lib/github_api_test.rb'

get_lab_names.each do |lab|
  lab_name = lab.split("-").join(",").gsub(","," ").capitalize
  Lab.create(lab_name_github: lab, lab_name_display: lab_name)
end
