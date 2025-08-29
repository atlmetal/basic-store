class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def current_store
    @current_store ||= Store.first || Store.create(name: 'My Store', total_sales: 0.0)
  end

  def current_user
    @current_user ||= current_store.users.first || current_store.users.create(
      name: 'Demo User', email: 'user@demo.com'
    )
  end
end
