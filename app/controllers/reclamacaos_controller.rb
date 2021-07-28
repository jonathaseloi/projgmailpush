class ReclamacaosController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  # GET /reclamacao or /reclamacao.json
  def index
    @pagy, @reclamacoes = Reclamacao.search(reclamacao_search_params)
    @naoiniciadas = Reclamacao.where(position:0).nao_iniciado.size
    @emandamento = Reclamacao.where(position:0).em_andamento.size
  end

  # GET /reclamacao/1 or /reclamacao/1.json
  def show
    @atendimento = Reclamacao.find(params[:id])
    @deps = Api::Ticket::DepartamentoService.run()
    @equipes = Api::Ticket::EquipeService.run()
    @servicos = Api::Ticket::ServicoService.run()
    @historico = Reclamacao.where(reclamacao_owner_id:@atendimento.reclamacao_owner_id).order(created_at: :desc)
  end

  def create
    @atendimento_pai = Reclamacao.find(params[:atendimento_pai_id])
    position = Reclamacao.where(reclamacao_owner_id: @atendimento_pai.reclamacao_owner_id).size
    @atendimento = Reclamacao.create(texto: params[:texto], position: position, 
      reclamacao_owner_id: @atendimento_pai.reclamacao_owner_id, type: @atendimento_pai.type, subject: "Resposta ao Cliente", 
      email_sender: "jonathaseloi@gmail.com")

    @atendimento_pai.update_column(:status, :em_andamento)
        
    # salvar ticket

    Api::Google::SendEmailService.new(@atendimento_pai.reclamacao_owner_id, @atendimento_pai.email_sender, params[:texto]).process

    if @atendimento_pai
      redirect_to @atendimento_pai
    end
  end

  def new
    @atendimento = Reclamacao.new 
  end

  private

  def reclamacao_search_params
    params.permit(:email_sender ,:type, :ticket_id, :status, :page)
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