class ReclamacaosController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  # GET /reclamacao or /reclamacao.json
  def index
    @pagy, @reclamacoes = Reclamacao.search(reclamacao_search_params)
    @naoiniciadas = Reclamacao.where(position:0, status: "NÃO INICIADO").size
    @emandamento = Reclamacao.where(position:0, status: "EM ANDAMENTO").size
    # Api::Google::PushNotificationService.new(JSON.parse("123")).watch
    # Api::Google::SendEmailService.new(Reclamacao.last.reclamacao_owner_id).process
  end

  # GET /reclamacao/1 or /reclamacao/1.json
  def show
    @atendimento = Reclamacao.find(params[:id])
    @deps = Api::Ticket::DepartamentoService.run()
    @equipes = Api::Ticket::EquipeService.run()
    @servicos = Api::Ticket::ServicoService.run()
    @historico = Reclamacao.where.not(position:0).where(reclamacao_owner_id:@atendimento.reclamacao_owner_id).order(created_at: :desc)
  end

  def create
    byebug  
    @atendimento = Reclamacao.new(reclamacao_params)
    # salvar ticket
    # enviar email respondendo

    if @atendimento
      redirect_to @atendimento
    end
  end

  def new
    @atendimento = Reclamacao.new 
  end

  private

  def reclamacao_search_params
    params.permit(:email_sender ,:type, :ticket_id, :page)
  end
end
# #<Reclamacao:0x00000000047f3308
# id: 7,
# texto: "Background job",
# message_id: "17aa1590c4dc2af8",
# history_id: "2209066",
# position: 0,
# reclamacao_owner_id: "17aa158f92cde4f4",
# created_at: Fri, 16 Jul 2021 20:31:38.881504000 UTC +00:00,
# updated_at: Fri, 16 Jul 2021 20:31:38.881504000 UTC +00:00,
# type: "Reclamacao",
# ticket_id: nil,
# snippet: nil,
# email_sender: "jonathaseloi@gmail.com",
# status: "NÃO INICIADO",
# subject: "Background job"> 