class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    if @contact_form.deliver
      flash[:notice] = "Thanks for your message!"
      redirect_to root_url
    else
      flash[:alert] = "Unable to send"
      render :new
    end
  end


end
