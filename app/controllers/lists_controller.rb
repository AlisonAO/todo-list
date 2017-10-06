class ListsController < ApplicationController
    def index
    @lists = current_user.lists
   end

  def show
    @list = current_user.lists.find(params[:id])
  end

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.create(list_params)
    if @list.save
      redirect_to "/lists"
    else
      render :new
    end
  end

  def edit
    @list = current_user.lists.find(params[:id])
  end

  def update
    @list = current_user.lists.find(params[:id])
    if @list.update(list_params)
      redirect_to "/lists"
    else
      render :edit
    end
  end

  def destroy
    current_user.lists.destroy(params[:id])
    redirect_to lists_url
  end

  protected
  def list_params
    params.require(:list).permit(:body)
  end
end
