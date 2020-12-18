module ItemsHelper
  def sold_out?(item)
    return Order.exists?(item_id: item.id)
  end
end
