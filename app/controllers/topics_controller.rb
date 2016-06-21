class TopicsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create, :destroy]

  def about

  end

  def index
    if params[:cid]
      category = Category.find(params[:cid])
      @topics = category.topics
    else
      @topics = Topic.all
    end

    @q = @topics.ransack(params[:q])
    @topics = @q.result(distinct: true).page(params[:page]).per(5)
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
    @comment = Comment.new
  end

  protected

  def topic_params
    params.require(:topic).permit(:title, :content, :category_ids => [])
  end



end
