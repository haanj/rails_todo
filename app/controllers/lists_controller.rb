class ListsController < ApplicationController
  before_action :logged_in_user, only: :index

  def create
    @list = List.new
  end

  def index
    @lists = List.all
  end
end
