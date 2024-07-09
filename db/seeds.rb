# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

articles = [
  {title: 'art 1', content: 'conteudo do art 1'},
  {title: 'art 2', content: 'conteudo do art 2'},
  {title: 'art 3', content: 'conteudo do art 3'}
]

Article.create(articles)