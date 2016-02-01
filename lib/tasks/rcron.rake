require 'open-uri'

namespace :rcron do
  desc 'Run Cron'
  task go: :environment do
  	puts 'Starting'

    url = 'https://en.wikipedia.org/wiki/Main_Page'
    doc = Nokogiri::HTML(open(url))
    puts doc.to_s.colorize(:blue)

  	puts 'Done'
  end  
end
