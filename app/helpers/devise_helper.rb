module DeviseHelper
  def bootstrap_alert(key)
    case key
    when "alert", "error", "danger"
      "danger"
    when "notice"
      "primary"
    when "success"
      "success"
    end
  end
end
