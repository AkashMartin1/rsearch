class DomainUrl < ActiveRecord::Base

  belongs_to :domain

  before_save :save_date_and_time_i
  before_create :create_correct_url

  def save_date_and_time_i
    self.date_and_time_i = Time.now.to_i
  end

  def create_correct_url
    domain_name = self.domain.name
    if self.url[0..1] == '//'
      self.url = "http:#{self.url}"
    end
    if self.url[0] == '/'
      self.url = "#{domain_name}#{self.url}"
    end
    if self.url[0..2].downcase == 'www'
      self.url = "http://#{self.url}"
    end
    if self.url[0..3].downcase != 'http'
      self.url = "http://#{self.url}"
    end
    return false if (self.url =~ /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/i) == nil
  end

end
