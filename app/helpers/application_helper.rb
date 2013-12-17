module ApplicationHelper

  def full_title(page_title)
    base_title = "Tilba Lake Community"
    if page_title.empty?
      base_title
    else
      "#{base_title} :: #{page_title}"
    end
  end

  # Resource helpers for devise
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  # helper class for tabs, adds 'active' class when on the input path
  def activepath?(test_path)
    return 'active' if (request.path == test_path)
    # return 'active' if (request.path == test_path and !current_user.nil?)
  end

  def activepath_fuzzy?(test_path)
    isActive = false
    Array(test_path).each do |param|
      isActive = isActive || request.path.include?(param)
    end
    return 'active' if isActive
  end

  # Flash message helpers
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-warning"
    end
  end

  # Paperclip file type icons
  def filetype_icon(filetype)
    return 'glyphicon-file' if filetype == 'application/pdf'
  end

end
