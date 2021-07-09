class Ticket < ApplicationRecord
  has_many :histtickets, dependent: :destroy

  validates_presence_of :departamento_id, :equipe_id, :servico_ticket_id, :data_abertura, :assunto, :descricao

  after_create :criar_interacao_certificacao

  MAX_FILESIZE = 500.kilobytes
  CERTIFICATE_RELEASE_REQUEST = [39].freeze

  Prioridade = {
    1 => "01. BAIXA",
    2 => "02. NORMAL",
    3 => "03. ALTA",
    4 => "04. URGENTE",
    5 => "05. IMEDIATA"
  }

  TIPO = {
    #TI
    1=>"01. ERRO",
    2=>"02. MELHORIA",
    3=>"03. SUPORTE",
    4=>"04. ACESSO",
    8=>"05. AVARIAS",
    9=>"06. CRIAÇÃO DE USUÁRIOS",
    5=>"07. SOLICITAÇÃO DE MATERIAL",

    #FINANCEIRO
    7=>"08. PEDIDO DE LIBERAÇÃO DE CERTIFICADO",
    10=>"09. DESLIGAMENTO DE USUÁRIOS",
    11 => "10. SOLICITAÇÃO DE VERBA PRAZO MAX. 3 DIAS",
    12 => "11. CANCELAMENTO E ESTORNO PRAZO MAX. 30 DIAS",
    13 => "12. NOTA FISCAL PRAZO MAX. 24 HS",

    #QUALIDADE
    14 => "13. CRIAÇÃO DOCUMENTAÇÃO",
    15 => "14. SUPORTE DE PROCESSO"

    #RELACIONAMENTO (relacionamento@ibccoaching.com.br)
    # 1 - SOLICITAÇÃO DE EAD
    # 2 - REMANEJAMENTO
    # 3 - PEDIDO DE MONITORIA
  }

  HUMANIZED_ATTRIBUTES = {
    #:solicitante => "Solicitante",
    :departamento => "Regra",
    :prioridade => "Prioridade",
    :data_abertura => "Data de abertura",
    :assunto => "Assunto",
    :descricao => "Descrição",
    :usuario => "Atendente",
    :data_fechamento => "Data de fechamento",
    :dificuldade => "Dificuldade",
    :observacao => "Observações",
    :status => "Situação",
    :created_at => "Criação",
    :updated_at => "Alteração",
    :tipo => "Serviço",
    :data_prevista => "Data prevista",
    :tempo_estimado => "Tempo estimado",
    :os_imagem => "Arquivo",
    :cliente_id => "Cliente",
    :avisar => "Avisar a:",
    :user_nome => "Solicitante"
  }

  Usuario = {
    1 => "01. HELP/SUPORTE",
    2 => "02. TI",
    3 => "04. FINANCEIRO",
    4 => "03. HELP/TI",
    5 => "05. CAC",
    6 => "06. QUALIDADE",
    7 => "07. RELACIONAMENTO",
    8 => "08. MARKETING",
    9 => "09. PARCERIAS"
  }

  Dificuldade = {
    1 => "01. BAIXA",
    2 => "02. MÉDIA",
    3 => "03. ALTA"
  }

  Status = {
    1 => "01. NOVO",
    2 => "02. EM ANDAMENTO",
    3 => "06. NAO APLICAVEL",
    4 => "03. RESOLVIDO",
    5 => "05. LIBERADO",
    6 => "04. PENDENTE",
  }
end
