class ContactController < ApplicationController
  def contattaci
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Contact.new
        format.html { render 'contattaci'}
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        format.html { render 'contattaci' }
        format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end
end
