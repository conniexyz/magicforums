class CommentsController<ApplicationController

  def index
    # @topics = Topic.all
    # @posts = Post.all
    # @comments = Comment.all
    # this one needs a topic and post id (Jun)
    @post = Post.find_by(id: params[:post_id])
    @topic = Topic.find_by(id: params[:topic_id])
    @comments = @post.comments.order("created_at ASC")

  end

  def new
    @topic = Topic.find_by(id: params[:topic_id])
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @topic = Topic.find_by(id: params[:topic_id])
    # @post = Post.new(post_params.merge(topic_id: params[:topic_id]))
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.create(comment_params.merge(post_id: @post.id))
    @new_comment = Comment.new

    if  @comment.save
      flash[:success] = "Your comment was posted."
       redirect_to topic_post_comments_path(@topic, @post)
      # you're creaing a comment not a post (Jun)
    else
      flash[:danger] = @comment.errors.full_messages
      render :new
    end
  end


  def edit

    @topic = Topic.find_by(id: params[:topic_id])
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.find_by(id: params[:id])

    # this one is missing the comment cause you're editing an existing comment (Jun)
  end

  def update
    @topic = Topic.find_by(id: params[:topic_id])
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.find_by(id: params[:id])
    # same with this one, you're updating a comment not a post in the comments controller(Jun)

    if @comment.update(comment_params)
      flash.now[:success] = "Your comment was updated."
      redirect_to topic_post_comments_path(@topic, @post)
    else
      flash.now[:danger] = @comment.errors.full_messages
      redirect_to edit_topic_post_comments_path(@topic, @post)
    end
  end

  def destroy
    @topic = Topic.find_by(id: params[:topic_id])
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.find_by(id: params[:id])
    # you're deleting a comment here not a topic (Jun)
    if @comment.destroy
      flash.now[:success] = "Your comment was deleted."
      redirect_to topic_post_comments_path(@topic, @post)
    end
  end


  private

  # this should be comment params, check your schema to see what you need to permit (Jun),
  # ok Jun, changed to comment params,
  def comment_params
    params.require(:comment).permit(:body, :image)
  end
end
