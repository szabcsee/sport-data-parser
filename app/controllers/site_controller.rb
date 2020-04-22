#app/controllers/site_controller.rb

class SiteController < ActionController::Base
  def index
    render file: 'public/index.html'
  end
end