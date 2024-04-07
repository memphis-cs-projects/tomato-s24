class ZordsController < ApplicationController

  def index
    @zords = Zord.order(:id)
    render :index
  end


end
