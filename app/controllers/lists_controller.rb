class ListsController < ApplicationController
  before_action :logged_in_user, only: :index
  before_action :set_list, only: [:edit, :update, :destroy]

  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    if @list.save
      redirect_to lists_path
    end
  end

  def index
    @lists = List.where(user_id: current_user.id)
    @list = List.new()
  end

  def edit
  end

  def destroy
    @list.destroy
    redirect_to lists_url
  end

  def update
    @list.update(list_params)
    redirect_to lists_path
  end

  private
    def set_list
      @list = List.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :description, :user_id)
    end
end
