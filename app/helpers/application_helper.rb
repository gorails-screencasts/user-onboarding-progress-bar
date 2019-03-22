module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def onboarding_step_icon(step_completed)
    color = step_completed ? "text-success" : "text-muted"
    content_tag :i, nil, class: ["fas", "fa-check", color]
  end
end
