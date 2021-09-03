module ApplicationHelper
  def label_name(label)
    case label.name
    when 'INBOX' then 'Boite de réception'
    when 'CATEGORY_PROMOTIONS' then 'Promotion'
    when 'CATEGORY_UPDATES' then 'Notification'
    when 'UNREAD' then 'Non lu'
    else
      label.name
    end
  end

  def label_text_color(label)
    label.text_color.present? ? label.text_color : "#666"
  end

  def label_background_color(label)
    label.background_color.present? ? label.background_color : "#ddd"
  end

  def priority_icon(domain)
    if domain["total"] > 10 && domain["ratio"] >= 0.5
      '<i class="fas fa-exclamation-circle"style="color: #f64747"></i>'.html_safe
    elsif domain["total"] > 5 || domain["ratio"] >= 0.2
      '<i class="fas fa-exclamation-circle" style="color: #f4b350"></i>'.html_safe
    else
      '<i class="fas fa-check-circle" style="color: #7befb2"></i>'.html_safe
    end
  end
end
