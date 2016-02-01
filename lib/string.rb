class String

  def valid_url?
    if (self =~ /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/i) == nil
      false
    else
      true
    end
  end
end