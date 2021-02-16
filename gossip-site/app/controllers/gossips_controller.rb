class GossipsController < ApplicationController

  before_action :current_user
  before_action :logged_in?, only: [:new, :create]

  def index
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(content: params['gossip']['content'], title: params['gossip']['title'])
    @gossip.user = current_user
    if @gossip.save
      flash[:success] = "Gossip successfully created"
      redirect_to gossips_path
    else
      flash[:alert]
      render 'new'
    end
  end

  def show
    @gossip = Gossip.find(params['id'])
    @comment = Comment.new
  end

  def edit
    @gossip = Gossip.find(params['id'])
  end

  def update
    @gossip = Gossip.find(params['id'])
    @gossip.update(post_params)
    if @gossip.valid?
      flash[:success] = "Gossip successfully edited"
      redirect_to gossips_path
    else
      flash[:alert]
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params['id'])
    @gossip.destroy
    flash[:success] = "Gossip successfully deleted"
    redirect_to gossips_path
  end

  private

  def post_params
    params.require(:gossip).permit(:title,:content)
  end

  def logged_in?
    unless current_user.nil?
      flash[:danger] = "You need to log in first"
      redirect_to root_path
    end
  end

end
