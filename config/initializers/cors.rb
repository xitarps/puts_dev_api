Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000', 'http://127.0.0.1:3000'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete]
  end
end
