class ContactController < ApplicationController
  def contattaci
    @contact = Contact.new(params[:contact])
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request

      if @contact.deliver
        # re-initialize Home object for cleared form
        @contact = Contact.new
        flash[:success] = 'Messaggio inviato, ti ricontatteremo al più presto!'
        redirect_to :contattaci
      else
        flash[:danger] = 'Errore! Il messaggio non è stato inviato'
        redirect_to :contattaci
      end
  end
end
