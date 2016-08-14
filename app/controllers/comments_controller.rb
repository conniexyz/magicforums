class CommentsController<ApplicationController

  def index
    @topics = Topic.all
    @posts = Post.all
    @comments = Comment.all
    # this one needs a topic and post id (Jun)
  end

  def new
    @topic = Topic.find_by(id: params[:topic_id])
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @topic = Topic.find_by(id: params[:topic_id])
    @post = Post.new(post_params.merge(topic_id: params[:topic_id]))
    # you're creaing a comment not a post (Jun)
    if @post.save
      redirect_to root_path
    else
      redirect_to new_topic_post_path
    end
  end


  def edit
    @post = Post.find_by(id: params[:id])
    @topic = @post.topic
    # this one is missing the comment cause you're editing an existing comment (Jun)
  end

  def update
    @topic = Topic.find_by(id: params[:topic_id])
    @post = Post.find_by(id: params[:id])
    # same with this one, you're updating a comment not a post in the comments controller(Jun)

    if @post.update(post_params)
      redirect_to topic_posts_path(@topic)
    else
      redirect_to edit_topic_post_path(@topic, @post)
    end
  end

  def destroy
    @topic = Topic.find_by(id: params[:id])
    # you're deleting a comment here not a topic (Jun)
    if @topic.destroy
      redirect_to topics_path
    else
      redirect_to topic_path(@topic)
    end
  end


private

  # this should be comment params, check your schema to see what you need to permit
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
