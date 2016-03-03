class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      @item = Item.update_items(params[:items])
      redirect_to @user, notice: "Item was saved successfully."
    else
      flash[:error] = "Error creating item. Please try again."
      render @user
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "#{@item.name} was deleted successfully!"
      redirect_to user_show_page
    else
      flash[:error] = "There was an error deleting the item."
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
