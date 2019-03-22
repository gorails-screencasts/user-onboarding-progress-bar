module UserOnboarding
  extend ActiveSupport::Concern

  def should_see_onboarding?
    !onboarding_completed_at? || onboarding_completed_at > 1.day.ago
  end

  def onboarding_percent
    return 100 if onboarding_completed_at?

    steps = [:twitter?, :has_team?]
    complete = steps.select{ |step| send(step) }
    percent = complete.length / steps.length.to_f * 100
    update(onboarding_completed_at: Time.current) if percent == 100
    percent
  end

  def has_team?
    teams.any?
  end
end
