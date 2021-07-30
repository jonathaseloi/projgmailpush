module AttendanceHelper
  def status_to_string(status)
    case status
      when "nao_iniciado"
        "Não Iniciado"
      when "em_andamento"
        "Em andamento"
      when "aguardando_resposta"
        "Aguardando resposta"
      when "resolvido"
        "Resolvido"
    end
  end

  def tipo_to_string(tipo)
    case tipo
      when "reclamacao"
        "Reclamação"
      when "cancelamento"
        "Cancelamento"
    end
  end

  def tipo_class(tipo)
    case tipo
      when "reclamacao"
        "bg-warning"
      when "cancelamento"
        "bg-info"
    end
  end
end