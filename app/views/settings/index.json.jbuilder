json.array!(@settings) do |setting|
  json.extract! setting, :id, :index, :status
  json.url setting_url(setting, format: :json)
end
