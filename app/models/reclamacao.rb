class Reclamacao < ApplicationRecord
  def self.search(params)
    params[:page] = 1 if params[:page].blank?
    if params.values.size == 1
      @pagy, @reclamacoes = pagy(Reclamacao.where("position = 0"), page: params[:page])
    else
      @pagy, @reclamacoes = pagy(Reclamacao.where("position = 0 && ((? != '%%' && email_sender LIKE ?) && (? = '' || type = ?) && (? = '' || ticket_id = ?))", params[:email_sender].to_s, "%"+params[:email_sender].to_s+"%", params[:type], params[:type], params[:ticket_id], params[:ticket_id]), page: params[:page])
    end
  end
end
