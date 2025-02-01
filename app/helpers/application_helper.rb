module ApplicationHelper
  def bootstrap_alert(key)
    case key
    when "alert", "danger"
      "danger"
    when "notice"
      "primary"
    when "success"
      "success"
    end
  end
end
