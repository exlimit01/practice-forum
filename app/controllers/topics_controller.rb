class TopicsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :destroy]

  def index
    @topics = Topic.page(params[:page]).per(5)
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    if @topic.save
      redirect_to topics_path
    else
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  protected

  def topic_params
    params.require(:topic).permit(:title, :content)
  end



end
