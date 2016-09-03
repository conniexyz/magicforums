class TopicsController < ApplicationController

  def index
    @topics = Topic.all.order(created_at: :ASC)
  end

  def new
    @topic = Topic.new
  end

  def create

    @topic = Topic.new(topic_params)
    # binding.pry

    if @topic.save
       flash[:success] = "You've created a new topic."
      redirect_to topics_path
    else
       flash[:danger] = @topic.errors.full_messages
      redirect_to new_topic_path
      #  render new_topic_path
    end
  end


  def edit
    @topic = Topic.find_by(id: params[:id])
  end

  def update
    # binding.pry
    @topic = Topic.find_by(id: params[:id])

    if @topic.update(topic_params)
      flash[:success] = "You've updated."
      redirect_to topics_path
    else
      flash[:danger] = @topic.errors.full_messages
      redirect_to edit_topic_path(@topic)
    end
  end

  def destroy
    @topic = Topic.find_by(id: params[:id])
    if @topic.destroy
      flash[:success] = "You've destroy."
      redirect_to topics_path
    else
      flash[:danger] = @topic.errors.full_messages
      redirect_to topic_path(@topic)
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end
