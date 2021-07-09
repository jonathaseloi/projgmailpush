class Histticket < ApplicationRecord
  belongs_to :ticket

  before_create :atualiza_status_ticket

  # Combobox Dificuldade
  Dificuldade = {
    1 => "01. BAIXA",
    2 => "02. MÉDIA",
    3 => "03. ALTA"
  }

  def dificuldade_text
    Dificuldade[dificuldade.to_i]
  end

  # Combobox Status
  Status = {
    1 => "01. NOVO",
    2 => "02. EM ANDAMENTO",
    3 => "03. NAO APLICAVEL",
    4 => "04. RESOLVIDO",
    5 => "05. LIBERADO",
    6 => "06. PENDENTE"
  }

  def status_text
    Status[status.to_i]
  end

  def atualiza_status_ticket
    ticket.update_attribute(:status, status.to_i)
  end

end
