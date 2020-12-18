class OrdersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_item
  before_action :move_to_index

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_destination_params)
    if @order_destination.valid?

      # 本来、例外のエラーハンドリングすべきだが、現時点割愛
      # エラーハンドリング例（https://pay.jp/docs/api/#error）
      pay_item
      # --------------------------------------------------------

      # ownerやbuyerなどの参照先IDの存在チェック、例外のエラーハンドリングが必要
      @order_destination.save
      # --------------------------------------------------------

      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if @item.owner.id == current_user.id || Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def order_destination_params
    params.require(:order_destination).permit(
      :item_id,
      :zip_code,
      :prefecture_id,
      :city,
      :address1,
      :address2,
      :telephone
    ).merge(
      item_id: params[:item_id],
      buyer_id: current_user.id,
      card_token: params[:card_token]
    )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_destination_params[:card_token],
      currency: 'jpy'
    )
  end
end
