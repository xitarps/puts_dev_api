class Api::V1::ArticlesController < Api::V1::ApplicationController
  before_action :authorize_user!

  def index
    @articles = Article.all
    render status: :ok
  end
end