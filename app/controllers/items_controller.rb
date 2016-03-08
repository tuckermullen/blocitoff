class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @items = @user.items
    @item = current_user.items.new(item_params)
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item was saved successfully."
    else
      flash[:error] = "Error creating item. Please try again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "#{@item.name} was deleted successfully!"
    else
      flash[:error] = "There was an error deleting the item."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
