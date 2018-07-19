
class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'
   
    def welcome_email(params)
      @order = params[:order]
      @lineitems = @order.line_items.order(created_at: :desc)
      mail(:to => @order.email, :subject => "Thank your for order #{@order.id}")
    end
  end
