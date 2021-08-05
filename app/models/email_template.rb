class EmailTemplate < ApplicationRecord
  validates :name, presence: { message: 'O nome precisa estar presente' }
  validates :description, length: { maximum: 256,
                                    message: 'A descrição deve possuir no máximo 256 caracteres' }
  validates :body, presence: { message: 'O conteúdo precisa estar presente' }

  def self.tinymce_templates_json
    order(:name).map &:tinymce_template_json
  end

  def variables_list
    body.scan(/(?:{{)(\w*.*)(?:}})/).flatten
  end

  def tinymce_template_json
    {
      title: name,
      url: "/email_templates/#{id}",
      description: description
    }
  end
end
