class EventMailer < ApplicationMailer
  before_action do
    @recipient = params[:recipient]
    @event = params[:event]
    @user = params[:user]
  end
  before_action :set_url , only: [:new_event]
  def new_event
    mail(to: @recipient.email, subject: "Someone you follow has created an event")
  end

  private

  def set_url
    @url = event_url(host:'crowdpublish.TV', id: @user.id)
  end
end
