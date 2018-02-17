module AddressHelper
  def address_form_title
    params[:delivery] ? 'Adresse de Livraison' : 'Adresse de Facturation'
  end
end