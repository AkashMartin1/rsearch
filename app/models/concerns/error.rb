class Error
  class << self
    def model_error(message)
      my_log ||= Logger.new("#{Rails.root}/log/model_error.log")
      my_log.debug(message.try(:join, "\n") || message) unless message.blank?
    end

  end
end