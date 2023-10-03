class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.dog
      # Redirect to walks_path for regular sign-ins
      dog_walks_path(current_user.dog)
    else
      # Redirect to new_dog_path if the user just created their account
      new_dog_path
    end
  end

end

def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
end
