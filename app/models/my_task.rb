require 'open-uri'
require_relative '../../app/helpers/application_helper'
include ApplicationHelper

class MyTask
  class << self
    def main(url='https://en.wikipedia.org/wiki/Main_Page')
      puts url.colorize(:green)
      Rails.logger.level = Logger::DEBUG
      puts 'Starting'
      doc        = open(url, :allow_redirections => :safe).read
      top_domain = get_host_without_www(url)
      # puts doc.to_s.colorize(:blue)
      doc.scan(/<a[^>]* href="([^"]*)"/).flatten.uniq.each do |link|
        begin
          begin
            llink  = link
            domain = get_host_without_www(link)
          rescue NoDomainFoundError
            puts 'NoDomainFoundError'.colorize(:pink)
            domain = top_domain
          end
          domain_object = Domain.find_or_create_by(name: domain)
          domain_url    = DomainUrl.new(url: llink, domain_id: domain_object.id)
          domain_url.save!
        rescue => e
          puts e.message.colorize(:red)
        end
      end
    end

    def url_fetch
      while(true) do
        DomainUrl.order(date_and_time_i: :desc).limit(100).each do |domain_url|
          begin
            main(domain_url.url)
          rescue => e
            puts e.message
          end
        end
      end
    end

    def fetch_links(doc)
      links = []
      doc.xpath('//a').each do |link|
        begin
          links << link.attributes['href'].value
        rescue => e
          puts e.message.colorize(:red)
        end
      end
      puts links.to_s.colorize(:green)
      links
    end
  end
end