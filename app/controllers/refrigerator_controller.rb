class RefrigeratorController < ApplicationController
  def index
    @itemInfo = ReadTables.get_info
  end
end