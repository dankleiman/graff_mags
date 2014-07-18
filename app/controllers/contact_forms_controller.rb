class ContactFormsController < ApplicationController
  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])
    if @contact_form.deliver
      begin
        Gibbon::API.new(ENV['MAILCHIMP_API_KEY']).lists.subscribe({:id => ENV['MAILCHIMP_LIST_ID'], :email => {:email => params[:contact_form][:email]}, :double_optin => false})
      rescue Gibbon::MailChimpError => e
        return redirect_to root_path, :flash => { error: e.message }
      end
      flash[:notice] = "Thanks for your message!"
      redirect_to root_url
    else
      flash[:alert] = "Unable to send"
      render :new
    end
  end


end
