class ApplicationController < ActionController::Base
  protect_from_forgery
  include ActionView::Helpers::NumberHelper
end
