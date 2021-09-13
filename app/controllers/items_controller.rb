class ItemsController < ApplicationController

  def index

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    item = item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id,
      :scheduled_day_id, :price, :image).merge(user_id: current_user.id) 
  end

end
