class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @items = @user.items
    @item = current_user.items.build(item_params)
    @item.user = @user
    
    if @item.save
      @item = Item.update_items(params[:items])
      redirect_to @user, notice: "Item was saved successfully."
    else
      flash[:error] = "Error creating item. Please try again."
      render @user
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
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
