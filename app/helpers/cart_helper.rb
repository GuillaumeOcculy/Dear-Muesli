module CartHelper
  def cart_delivery_title
    current_order.free_delivery? ? 'LIVRAISON GRATUITE ACTIVÉ' : 'Livraison gratuite à partir de 35€ d\'achat.'
  end
end