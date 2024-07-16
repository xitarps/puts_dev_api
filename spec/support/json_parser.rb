module JsonParser
  def json_to_hash(json)
    JSON.parse(json, symbolize_names: true)
  end
end
