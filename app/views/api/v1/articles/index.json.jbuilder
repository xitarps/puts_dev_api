json.data @articles do |article|
  json.partial! 'api/v1/articles/article', article:
end
