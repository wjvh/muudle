module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Muudle"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
    image_tag("muudleLogo.png", :alt => "Muudle Logo")
  end

  def signupButton
    image_tag("signupButton.png", :alt => "Signup to Muudle!")
  end

  def resource_name
    :user
  end
 
  def resource
    @resource ||= User.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
