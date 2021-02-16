class OrderMailer < ApplicationMailer
    default from: 'animalmatching2020@gmail.com'

    def order_completed(order)
      @order = order
      @customer = order.user
      mail(to: 'animalmatching2020@yopmail.com', subject: 'Nouvelle commande')
    end

    def order_sent(order)
        @order = order
        @customer = order.user
        mail(to: @customer.email, subject: 'Votre nouvelle commande Chatons')
    end    
  
end
