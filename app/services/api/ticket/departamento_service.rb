require 'uri'
require 'net/http'

module Api::Ticket
  class DepartamentoService
    def self.run
      new.run
    end

    def run
      process
    end

    def process
      uri = URI('http://localhost:3000/api/atendimento/tickets/departamentos?api_key=aojmhoB8nTvaVWtpph1MauanCsbq5ofxbcyahkozn&id=1635')
      res = Net::HTTP.get_response(uri)
      objJson = JSON.parse(res.body)

      @deps = []

      objJson.each { |objeto| @deps << Departamento.new(objeto) }
      @deps
    end
  end
end
