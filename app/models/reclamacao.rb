class Reclamacao < ApplicationRecord
  def self.search(email_sender, type, ticket_id, page)
    page = 1 if page.blank?
    @pagy, @reclamacoes = pagy(Reclamacao.where("position = 0 && ((? != '' && email_sender LIKE ?) || (? = '' || type = ?) || (? != '' && ticket_id = ?))", email_sender.to_s, "%"+email_sender.to_s+"%", type, type, ticket_id, ticket_id), page: page)
  end
end
