class ItemsController < ApplicationController

  def create
    # @item = Item.new
    @user = User.find(params[:user_id])
    @item = Item.new(item_params)
    @item.user = current_user
    # add save functionality
    if @item.save
      @item = Item.update_items(params[:items])
      redirect_to current_user, notice: "Item was saved successfully."
    else
      flash[:error] = "Error creating item. Please try again."
      render user_show_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end
end
