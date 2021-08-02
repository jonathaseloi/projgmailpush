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
    set_email_templates
  end

  def create
    byebug
    @atendimento_pai = Reclamacao.find(params[:atendimento_pai_id])
    position = Reclamacao.where(reclamacao_owner_id: @atendimento_pai.reclamacao_owner_id).size
    @atendimento = Reclamacao.create(texto: params[:texto], position: position, 
      reclamacao_owner_id: @atendimento_pai.reclamacao_owner_id, tipo: @atendimento_pai.tipo, subject: "Resposta ao Cliente", 
      email_sender: "system@system.com.br")

    @atendimento_pai.em_andamento!
    if (params[:actionatend] == "naoprocede")
      Api::Google::SendEmailService.new(@atendimento_pai.reclamacao_owner_id, @atendimento_pai.email_sender, params[:texto]).process
    else
      # Enviar para responsavel da area selecionada
      # Api::Google::SendEmailService.new(@atendimento_pai.reclamacao_owner_id, @atendimento_pai.email_sender, params[:texto]).process
    end
    
    if @atendimento_pai
      redirect_to @atendimento_pai
    end
  end

  def new
    @atendimento = Reclamacao.new 
  end

  def close
    @atendimento = Reclamacao.find(params[:id])
    @atendimento.resolvido!

    if @atendimento
      redirect_to @atendimento
    end
  end

  def open
    @atendimento = Reclamacao.find(params[:id])
    @atendimento.em_andamento!

    if @atendimento
      redirect_to @atendimento
    end
  end

  private

  def reclamacao_search_params
    params.permit(:email_sender ,:tipo, :num_protocolo, :status, :page)
  end

  def set_email_templates
    @email_templates = EmailTemplate.tinymce_templates_json
  end
end
