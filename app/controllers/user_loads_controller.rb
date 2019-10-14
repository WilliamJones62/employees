class UserLoadsController < ApplicationController
  def import
    UserLoad.import(params[:file])
    redirect_to root_url, notice: "SSN4s imported."
  end
end
