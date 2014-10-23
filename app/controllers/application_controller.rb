class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
        html_tag
    end
end
