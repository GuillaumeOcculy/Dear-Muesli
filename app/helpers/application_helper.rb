module ApplicationHelper
  def current_order
    @current_order ||= Order.find(cookies.permanent[:order_id]) if cookies.permanent[:order_id]
  end
end
