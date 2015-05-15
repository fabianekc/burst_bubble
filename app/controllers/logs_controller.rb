class LogsController < ApplicationController
  before_action :logged_in
  def index
    @logs = Log.all.order(created_at: :desc)
  end
end
