class WebContent < ActiveRecord::Base

  before_save :update_text_data


  def update_text_data
    self.text_data = Nokogiri::HTML(self.data).text if self.data != self.data_was
    true
  rescue => e
    Error.model_error(e.message)
    Error.model_error(e.backtrace)
  end

  searchable do
    text :text_data
  end
end
