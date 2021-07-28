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

  def type_class(type)
    case type
      when "Reclamacao"
        "bg-warning"
      when "Cancelamento"
        "bg-info"
    end
  end
end