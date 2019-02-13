class ApplicationController < ActionController::Base
  before_action :load_user
  before_action :load_tests

  def load_user
    @user = User.first
  end

  def load_tests
    @tests = @user.tests
  end
end
