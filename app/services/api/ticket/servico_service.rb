require 'uri'
require 'net/http'

module Api::Ticket
  class ServicoService
    def self.run
      new.run
    end

    def run
      process
    end

    def process
      uri = URI('http://localhost:3000/api/atendimento/tickets/servicos?api_key=aojmhoB8nTvaVWtpph1MauanCsbq5ofxbcyahkozn&id=1635')
      res = Net::HTTP.get_response(uri)
      objJson = JSON.parse(res.body)

      @hashServico = {}
      @servicos = []
      
      objJson.each_with_index { |objeto, index| 
        objeto.first[1].each { |s| @servicos << ServicoTicket.new(s) }
        @hashServico[objeto.first[0]] = @servicos
        @servicos = []
      }
      @hashServico
    end
  end
end
