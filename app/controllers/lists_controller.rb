class ListsController < ApplicationController
  before_action :logged_in_user, only: :index

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

  def destroy
    @list = current_user.lists.find_by(id: params[:id])
    @list.destroy
    redirect_to lists_url
  end

  private

    def list_params
      params.require(:list).permit(:name, :description, :user_id)
    end
end
