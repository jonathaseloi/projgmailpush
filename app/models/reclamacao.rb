class Reclamacao < ApplicationRecord
  def self.search(email_sender, type)
    if email_sender.present? || type.present?
      @reclamacoes = Reclamacao.where(type: type, position: 0).where("email_sender LIKE ?", "%"+email_sender+"%" )
    else
      @reclamacoes = Reclamacao.where(position: 0)
    end
  end
end
