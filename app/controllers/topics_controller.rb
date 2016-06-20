class TopicsController < ApplicationController
  def index
    @topics = Topic.page(params[:page]).per(5)
  end
end
