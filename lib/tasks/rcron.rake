require 'open-uri'
require_relative '../../app/helpers/application_helper'
include ApplicationHelper

namespace :rcron do
  desc 'Run Cron'
  task go: :environment do
    puts Rails.env
    Rails.logger.level = Logger::DEBUG
    puts 'Starting'
    url = 'https://en.wikipedia.org/wiki/Main_Page'
    doc = Nokogiri::HTML(open(url))
    top_domain = get_host_without_www url
    links = []
    # puts doc.to_s.colorize(:blue)
    doc.xpath('//a').each do |link|
      begin
        begin
          llink = link.attributes['href'].value
          domain = get_host_without_www(link.attributes['href'].value)
        rescue NoDomainFoundError
          puts 'NoDomainFoundError'.colorize(:pink)
          domain = top_domain
        end
        domain_object = Domain.find_or_create_by(name: domain)
        domain_url = DomainUrl.new(url: llink, domain_id: domain_object.id)
        domain_url.save!
      rescue => e
        puts e.message.colorize(:red)
      end
    end
    puts 'Done'
  end
end
