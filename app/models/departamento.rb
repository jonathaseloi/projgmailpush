class Departamento < ApplicationRecord
  has_many :equipes

  def nome_com_sigla
    "#{sigla} - #{nome}"
  end
end
