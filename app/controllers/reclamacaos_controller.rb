class ReclamacaosController < ApplicationController
  skip_before_action :verify_authenticity_token

  # GET /reclamacao or /reclamacao.json
  def index
    @reclamacoes = Reclamacao.search(params[:email_sender], params[:type])
    @naoiniciadas = Reclamacao.where(position:0, status: "NÃO INCIADO").size
    # Api::Google::PushNotificationService.new(JSON.parse("123")).watch
  end

  # GET /reclamacao/1 or /reclamacao/1.json
  def show
  end

  private

  def reclamacao_params
    params.require(:reclamacao).permie(:email_sender ,:type)
  end
end
