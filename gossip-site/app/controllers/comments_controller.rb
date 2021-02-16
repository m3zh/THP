class CommentsController < ApplicationController

  def new
    @gossip = Gossip.find(params['gossip_id'])
    @comment = Comment.new
  end

  def create
    @gossip = Gossip.find(params['gossip_id'])
    @comment = Comment.new(user: User.last, content: params['comment']['content'])
    if @comment.save
      @gossip.comments << @comment
      flash[:success] = "Comment successfully created"
      redirect_to gossip_path(params['gossip_id'])
    else
      flash[:alert]
      render 'new'
    end
  end

  def show
    @gossip = Gossip.find(params['gossip_id'])
    @comment = Comment.find(params['id'])
  end

  def edit
    @gossip = Gossip.find(params['gossip_id'])
    @comment = Comment.find(params['id'])
  end

  def update
    @gossip = Gossip.find(params['id'])
    @comment = Comment.find(params['id'])
    @comment.update(post_params)
    if @comment.valid?
      flash[:success] = "Comment successfully edited"
      redirect_to gossip_path(params['gossip_id'])
    else
      flash[:alert]
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params['id'])
    @comment.destroy
    redirect_to gossip_path(params['gossip_id'])
  end

  private

  def post_params
    params.require(:comment).permit(:title,:content)
  end

end
