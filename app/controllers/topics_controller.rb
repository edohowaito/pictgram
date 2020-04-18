class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all.includes(:favorite_users)
    
    #追加
    #@topics = Topic.includes(:user).find(params[:id])
    #@comments = @topic.comments.includes(:user).all
    #@comment  = @topic.comments.build(user_id: current_user.id) if current_user
    #追加
    
  end
  
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
  
end
