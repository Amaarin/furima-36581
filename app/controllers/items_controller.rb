class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_set, only: [:edit, :update, :show, :destroy]
  # before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update] 

  def index
    @items = Item.all.order("created_at DESC")
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

  def edit
  
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :description, :category_id, :status_id, :shipping_cost_id, :prefecture_id,
      :scheduled_day_id, :price, :image).merge(user_id: current_user.id) 
  end

  def item_set
    @item = Item.find(params[:id])
  end

  # def contributor_confirmation
  #   redirect_to root_path if current_user != @item.user
  # end

  def move_to_index
    redirect_to root_path if current_user.id != @item.user.id || @item.buy.present?
  end

end
