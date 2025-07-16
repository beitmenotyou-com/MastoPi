class OnboardingController < ApplicationController
  STEPS = %w[domain email federation admin_user finish]

  before_action :set_step

  def show
    render @step
  end

  def update
    case @step
    when "federation"
      remote = params[:remote_instance]
      begin
        uri = URI.parse("https://#{remote}/.well-known/nodeinfo")
        res = Net::HTTP.get_response(uri)
        @federation_status = res.is_a?(Net::HTTPSuccess) ? "Success! Federation is possible." : "Failed: #{res.code} #{res.message}"
      rescue => e
        @federation_status = "Error: #{e.message}"
      end
      render @step and return
    when "admin_user"
      user = User.new(
        username: params[:username],
        email: params[:email],
        password: params[:password],
        admin: true
      )
      unless user.save
        flash.now[:alert] = user.errors.full_messages.join(", ")
        render @step and return
      end
    end

    if valid_step_data?
      save_step_data
      next_step = STEPS[STEPS.index(@step) + 1]
      if next_step
        redirect_to onboarding_path(step: next_step)
      else
        clear_onboarding_data
        redirect_to root_path, notice: "Onboarding complete!"
      end
    else
      flash.now[:alert] = "Please correct the errors below."
      render @step
    end
  end

  private

  def set_step
    @step = params[:step]
    redirect_to onboarding_path(step: STEPS.first) unless STEPS.include?(@step)
  end

  def onboarding_data
    session[:onboarding] ||= {}
  end

  def save_step_data
    onboarding_data.merge!(params.permit!.to_h)
    session[:onboarding] = onboarding_data
  end

  def clear_onboarding_data
    session.delete(:onboarding)
  end

  def valid_step_data?
    # TODO: Implement validation per step
    true
  end
end
