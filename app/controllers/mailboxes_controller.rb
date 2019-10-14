class MailboxesController < ApplicationController

  def import
    Mailbox.import(params[:file])
    redirect_to root_url, notice: "Mailbox list imported."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def mailbox_params
      params.require(:mailbox).permit(:email, :businessphone, :firstname, :lastname)
    end
end
