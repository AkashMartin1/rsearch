module ApplicationHelper

  def get_host_without_www(url)
    url = "http://#{url}" if URI.parse(url).scheme.nil?
    host = URI.parse(url).host
    raise NoDomainFoundError if host.nil?
    host = host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end

end


class NoDomainFoundError < Exception; end