class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = current_user.comments.build(comments_params)
    authorize @comment
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment created successfully."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving comment. Please try again."
      redirect_to [@topic, @post]
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
     flash[:notice] = "Comment was removed."
     redirect_to [@topic, @post]
    else
     flash[:error] = "Comment couldn't be deleted. Try again."
     redirect_to [@topic, @post]
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:body)
  end
end