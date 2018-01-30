class CartService
  def initialize(order:, user:, params:)
    @order  = order
    @user   = user
    @params = params
  end

  def add_to_cart
    product = Product.find(@params[:product_id])
    price   = @params[:quantity].to_f * product.price
    @order.order_items.create(product: product, quantity: @params[:quantity].to_i, total_price: price, unit_price: product.price)
    true
  end

end