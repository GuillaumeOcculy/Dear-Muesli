class CartService
  def initialize(order:, user:, params:)
    @order  = order
    @user   = user
    @params = params
  end

  def add_to_cart
    product = Product.find(@params[:product_id])
    price   = @params[:quantity].to_f * product.price
    @order.update(user: @user) if !@order.user_id && @user 

    if order_item = @order.order_items.where(product_id: product.id).last
      order_item.update(quantity: order_item.quantity + @params[:quantity].to_i, total_price: order_item.total_price + price, unit_price: product.price)
    else
      @order.order_items.create(product: product, quantity: @params[:quantity].to_i, total_price: price, unit_price: product.price)
    end
    true
  end

  def checkout
    if @order.update(@params.merge(status: 'placed', subtotal: @order.total_item_price, shipping: @order.delivery_cost, total: @order.total_price))
      if @params[:addresses_attributes]['0'][:same_as_delivery] == '1'
        delivery_address = @order.addresses.first.dup
        delivery_address.category = 'delivery'
        delivery_address.save
      end
      true
    else
      false
    end
  end

end