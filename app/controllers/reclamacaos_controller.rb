class ReclamacaosController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  # GET /reclamacao or /reclamacao.json
  def index
    @pagy, @reclamacoes = Reclamacao.search(params[:email_sender], params[:type], params[:ticket_id], params[:page])
    @naoiniciadas = Reclamacao.where(position:0, status: "NÃO INICIADO").size
    @emandamento = Reclamacao.where(position:0, status: "EM ANDAMENTO").size
    # Api::Google::PushNotificationService.new(JSON.parse("123")).watch
  end

  # GET /reclamacao/1 or /reclamacao/1.json
  def show
    @atendimento = Reclamacao.find(params[:id])
    @deps = Api::Ticket::DepartamentoService.run()
    @equipes = Api::Ticket::EquipeService.run()
    @servicos = Api::Ticket::ServicoService.run()
  end

  private

  def reclamacao_params
    params.require(:reclamacao).permie(:email_sender ,:type)
  end
end
