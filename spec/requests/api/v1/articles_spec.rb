require 'rails_helper'

RSpec.describe 'Articles' do
  before(:each) { Article.create(title: 'art 2', content: 'conteudo do art 2') }
  let(:header) { http_basic_auth_header }

  context "GET api/v1/articles" do
    it 'responds with status Ok' do
      get '/api/v1/articles.json', headers: header

      expect(response).to have_http_status(:ok) 
    end

    it 'responds with correct persisted article json' do
      get '/api/v1/articles.json', headers: header

      expect(json_to_hash(response.body)[:data].first).not_to have_key(:created_at)
      expect(json_to_hash(response.body)[:data].first).not_to have_key(:updated_at)
      expect(response.body).to include('art 2')
      expect(response.body).to include('conteudo do art 2')
    end
  end
end
