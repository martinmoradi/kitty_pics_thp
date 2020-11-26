class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :only_admin

  def only_admin
    !!current_user.is_admin
  end
end
