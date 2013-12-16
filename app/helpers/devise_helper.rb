module DeviseHelper
  def devise_errors
    if resource.errors.empty?
      return ""
    else
      return resource.errors.messages
    end
  end
end