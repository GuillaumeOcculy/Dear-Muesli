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

end