module ApplicationHelper

  def full_title(page_title)
    base_title = "Tilba Lake Community"
    if page_title.empty?
      base_title
    else
      "#{base_title} :: #{page_title}"
    end
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

end
