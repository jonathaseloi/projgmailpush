require 'uri'
require 'net/http'

module Api::Ticket
  class EquipeService
    def self.run
      new.run
    end

    def run
      process
    end

    def process
      uri = URI('http://localhost:3000/api/atendimento/tickets/equipes?api_key=aojmhoB8nTvaVWtpph1MauanCsbq5ofxbcyahkozn&id=1635')
      res = Net::HTTP.get_response(uri)
      objJson = JSON.parse(res.body)

      @hashEquipe = {}
      @equipes = []
      
      objJson.each_with_index { |objeto, index| 
        objeto.first[1].each { |eq| @equipes << Equipe.new(eq) }
        @hashEquipe[objeto.first[0]] = @equipes
        @equipes = []
      }
      @hashEquipe
    end
  end
end
