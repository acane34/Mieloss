class RefrigeratorController < ApplicationController
  def index
    @itemInfo = ReadTables.get_info
  end

  def destroy
    DeleteItems.delete_items(params[:Type], params[:Item])
    redirect_to refrigerator_url
  end
end