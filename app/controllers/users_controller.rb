class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(params[:id])
    @item = Item.new
    # @items = @user.items.visible_to(current_user)
  end
end
