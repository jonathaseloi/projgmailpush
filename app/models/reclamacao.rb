class Reclamacao < ApplicationRecord
  enum status: { nao_iniciado: 0, em_andamento: 1, aguardando_resposta: 2, resolvido: 3 }

  def self.search(params)
    params[:page] = 1 if params[:page].blank?
    if params.values.size == 1
      @pagy, @reclamacoes = pagy(Reclamacao.where("position = 0"), page: params[:page])
    else
      @pagy, @reclamacoes = pagy(Reclamacao.where("position = 0 && ((? != '%%' && email_sender LIKE ?) && (? = '' || type = ?) && (? = '' || ticket_id = ?) && (? = '' || status = ?))", params[:email_sender].to_s, "%"+params[:email_sender].to_s+"%", params[:type], params[:type], params[:ticket_id], params[:ticket_id], params[:status], params[:status]), page: params[:page])
    end
  end

  def self.getStatus
    case status
      when :nao_iniciado
        "Não Iniciado"
      when :em_andamento
        "Em andamento"
      when :aguardando_resposta
        "Aguardando resposta"
      when :resolvido
        "Resolvido"
    end
  end
end
