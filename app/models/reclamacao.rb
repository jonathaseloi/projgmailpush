class Reclamacao < ApplicationRecord
  enum status: { nao_iniciado: 0, em_andamento: 1, aguardando_resposta: 2, resolvido: 3 }
  enum tipo: { reclamacao: 0, cancelamento: 1}

  def self.search(params)
    params[:page] = 1 if params[:page].blank?
    if params.values.size == 1
      @pagy, @reclamacoes = pagy(Reclamacao.where("position = 0").order('status: 0, updated_at: :desc'), page: params[:page])
    else
      @pagy, @reclamacoes = pagy(Reclamacao.where("position = 0 && ((? != '%%' && email_sender LIKE ?) && (? = '' || tipo = ?) && (? = '' || num_protocolo = ?) && (? = '' || status = ?))", params[:email_sender].to_s, "%"+params[:email_sender].to_s+"%", params[:tipo], params[:tipo], params[:num_protocolo], params[:num_protocolo], params[:status], params[:status]).order('status: 0, updated_at: :desc'), page: params[:page])
    end
  end
end
