# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 201480629153145) do

  create_table "acao_parcerias", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "title"
    t.boolean "active", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acao_qualidades", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "reuniao"
    t.text "acao"
    t.integer "area"
    t.integer "responsavel_id"
    t.date "data_solicitacao"
    t.date "prazo"
    t.boolean "concluso", default: false
    t.date "concluso_em"
    t.boolean "cancelado", default: false
    t.date "cancelado_em"
    t.integer "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "attachment"
    t.index ["responsavel_id"], name: "index_acao_qualidades_on_responsavel_id"
    t.index ["user_id"], name: "index_acao_qualidades_on_user_id"
  end

  create_table "acompanhamento_de_acoes", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "acao_id"
    t.date "data_acompanhamento"
    t.boolean "reagendar", default: false
    t.date "novo_prazo"
    t.boolean "concluso", default: false
    t.date "concluso_em"
    t.boolean "cancelado", default: false
    t.date "cancelado_em"
    t.text "comentario"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "attachment"
    t.boolean "confirmation_needed", default: false
    t.index ["acao_id"], name: "index_acompanhamento_de_acoes_on_acao_id"
    t.index ["user_id"], name: "index_acompanhamento_de_acoes_on_user_id"
  end

  create_table "activity_log_actions", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "action", null: false
    t.string "color_hex", limit: 7
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_logs", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "activity_log_action_id"
    t.integer "sourceable_id"
    t.string "sourceable_type"
    t.integer "targetable_id"
    t.string "targetable_type"
    t.datetime "created_at", null: false
    t.index ["activity_log_action_id"], name: "index_activity_logs_on_activity_log_action_id"
    t.index ["sourceable_id", "sourceable_type"], name: "index_activity_logs_on_sourceable_id_and_sourceable_type"
    t.index ["targetable_id", "targetable_type"], name: "index_activity_logs_on_targetable_id_and_targetable_type"
    t.index ["user_id"], name: "index_activity_logs_on_user_id"
  end

  create_table "address_kinds", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "zip_code"
    t.string "district"
    t.string "street"
    t.string "number"
    t.text "complement"
    t.text "note"
    t.boolean "main"
    t.integer "address_kind_id", default: 1
    t.integer "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "alunos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cliente_id"
    t.string "nome_cracha"
    t.integer "turma_id"
    t.integer "produto_id"
    t.string "codigo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "pedido_id"
    t.integer "status"
    t.boolean "presente", default: false
    t.boolean "confirmado", default: false
    t.boolean "presente_modulo1", default: false
    t.boolean "presente_modulo2", default: false
    t.boolean "confirmado_modulo1", default: false
    t.boolean "confirmado_modulo2", default: false
    t.integer "confmod1"
    t.integer "confmod2"
    t.integer "confint"
    t.boolean "lancamento", default: true
    t.boolean "ficha_liberada", default: false
    t.boolean "excecaomod2", default: false
    t.integer "conceito"
    t.integer "frequencia"
    t.integer "status_certificado"
    t.integer "situacao_aluno"
    t.integer "carga_horaria"
    t.string "registro_certificado"
    t.integer "nota_conclusao_curso"
    t.string "titulo_trabalho"
    t.text "registro_cac"
    t.date "data_envio_certificacao"
    t.integer "owner_id"
    t.datetime "e_ticket"
    t.datetime "check_in"
    t.string "nome"
    t.string "documento", limit: 45
    t.string "telefone", limit: 45
    t.string "email", limit: 245
    t.integer "certification_fee"
    t.string "conference_url"
    t.integer "item_id"
    t.date "work_receive"
    t.date "work_approval"
    t.text "concept_description"
    t.datetime "moodle_created_at"
    t.text "moodle_response"
    t.boolean "request_cancellation", default: false
    t.integer "work_status"
    t.index ["cliente_id"], name: "index_alunos_on_cliente_id"
    t.index ["pedido_id"], name: "fk_pedidos_alunos_idx"
    t.index ["pedido_id"], name: "index_alunos_on_pedido_id"
    t.index ["turma_id"], name: "index_alunos_on_turma_id"
  end

  create_table "alunos_portal_tickets", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "aluno_id"
    t.integer "portal_ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id", "portal_ticket_id"], name: "index_alunos_portal_tickets_on_aluno_id_and_portal_ticket_id"
    t.index ["portal_ticket_id"], name: "index_alunos_portal_tickets_on_portal_ticket_id"
  end

  create_table "angels", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone01"
    t.string "phone02"
    t.integer "gender"
    t.date "birthday"
    t.string "document"
    t.string "cpf"
    t.string "observation"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answers", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "question_id"
    t.string "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areas_de_atuacao", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "ddd", null: false
    t.string "cidade", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "estado"
    t.index ["ddd", "cidade"], name: "index_areas_de_atuacao_on_ddd_and_cidade"
  end

  create_table "atendimentos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "atendente"
    t.text "observacao"
    t.integer "origem"
    t.string "refer_url"
    t.string "refer_ga"
    t.string "pg_origem"
    t.string "celular"
    t.text "resposta01"
    t.integer "resposta02"
    t.integer "resposta03"
    t.string "indicacao"
    t.integer "cliente_id"
    t.integer "classificacao"
    t.string "overflow", limit: 30
    t.string "source", limit: 30
    t.integer "service_strategy"
    t.integer "service_strategy_kind"
    t.integer "origin_category"
  end

  create_table "atendimentosite_clientes", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "atendimentosite_id"
    t.integer "cliente_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["atendimentosite_id"], name: "index_atendimentosite_clientes_on_atendimentosite_id"
    t.index ["cliente_id"], name: "index_atendimentosite_clientes_on_cliente_id"
    t.index ["user_id"], name: "index_atendimentosite_clientes_on_user_id"
  end

  create_table "atendimentosites", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.string "email", default: ""
    t.integer "user_id"
    t.string "atendente"
    t.text "observacao"
    t.integer "origem"
    t.string "refer_url"
    t.string "refer_ga"
    t.string "pg_origem"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "processado", default: false
    t.integer "classificacao"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_campaign"
    t.string "utm_term"
    t.string "utm_content"
    t.text "adw_source"
    t.text "adw_medium"
    t.text "adw_campaign"
    t.text "adw_term"
    t.text "adw_content"
    t.boolean "first_contact", default: false, null: false
    t.integer "produto_id"
    t.integer "fk_origem"
    t.string "pg_anterior"
    t.string "persona"
    t.string "location"
    t.string "datetime"
    t.boolean "send_to_vd", default: true
    t.string "gclid"
    t.string "occupation"
    t.string "enrollment_form"
    t.index ["email"], name: "idx_atendimentosites_email"
    t.index ["user_id"], name: "index_atendimentosites_on_user_id"
  end

  create_table "atribuicao_lead_agentes", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "agente_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "ultima_atribuicao", precision: 15, scale: 5
    t.index ["agente_id"], name: "index_atribuicao_lead_agentes_on_agente_id"
  end

  create_table "attachments", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "file"
    t.integer "attachmentable_id"
    t.string "attachmentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendance_controls", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "aluno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bancos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "codigo"
    t.string "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "ativo", default: true
  end

  create_table "bandeiras", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "ativo", default: true
  end

  create_table "bank_details", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "agency"
    t.string "account"
    t.integer "banco_id"
    t.integer "bank_detailable_id"
    t.string "bank_detailable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["banco_id"], name: "index_bank_details_on_banco_id"
    t.index ["bank_detailable_id"], name: "index_bank_details_on_bank_detailable_id"
  end

  create_table "bonus_assessments", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "produto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.integer "product_assessment_id"
    t.integer "turma_id"
    t.string "classification"
  end

  create_table "bonusevales", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "tipo"
    t.date "data_solicitacao"
    t.text "motivo"
    t.integer "user_id"
    t.integer "colaborador_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "valor", precision: 12, scale: 2
    t.decimal "porcentagem_comissao", precision: 12, scale: 2
    t.decimal "valor_venda", precision: 12, scale: 2
    t.integer "mes"
    t.integer "ano"
    t.index ["colaborador_id"], name: "index_bonusevales_on_colaborador_id"
    t.index ["user_id"], name: "index_bonusevales_on_user_id"
  end

  create_table "buzzlead_error_messages", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "origin_id"
    t.string "origin_type"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buzzlead_indications", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "pedido_id"
    t.integer "aluno_id"
    t.integer "buzzlead_request_id", null: false
    t.integer "indicated_id", null: false
    t.integer "ambassador_id", null: false
    t.integer "interacao_id"
    t.string "vendor", null: false
    t.boolean "converted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buzzlead_requests", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "indicated_name"
    t.string "indicated_email"
    t.string "indicated_phone"
    t.string "origin"
    t.string "vendor"
    t.string "ambassador_name"
    t.string "ambassador_email"
    t.string "ambassador_phone"
    t.boolean "processed", default: false
    t.integer "tries", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buzzlead_rewards", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "reward_type"
    t.integer "target_points"
    t.integer "reward_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buzzlead_sender_requests", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "sender_id"
    t.string "sender_type"
    t.string "action"
    t.boolean "processed", default: false
    t.integer "tries", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "caixas", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.decimal "saldo_inicial", precision: 10
    t.text "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "ativo", default: true
  end

  create_table "cargos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_products", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "trainer_category_id"
    t.integer "facilitador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_surveys", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "survey_id"
    t.float "average"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ccs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "codigo"
    t.string "nome"
    t.text "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "ativo", default: true
    t.boolean "recebe_lancamento", default: true
    t.integer "nivel"
    t.integer "subcategoria"
  end

  create_table "cds", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "pedido_id"
    t.integer "status_pedido"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "data_venda"
    t.string "numero_registro_assessment"
    t.text "observacao_cancelamento"
    t.integer "motivo_cancelamento"
    t.text "observacao_pendencia"
    t.integer "motivo_pendencia"
    t.boolean "estorno", default: false
    t.decimal "valor_recebido", precision: 12, scale: 2
    t.integer "valor_a_devolver"
    t.decimal "valor_devolvido", precision: 12, scale: 2
    t.date "data_devolucao"
    t.integer "credor_id"
    t.text "observacao_de_pendencia"
    t.boolean "ordem_pagamento", default: false
    t.index ["pedido_id"], name: "index_cds_on_pedido_id"
  end

  create_table "certificados", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "situacao"
    t.integer "aluno_id"
    t.integer "user_id"
    t.boolean "permuta"
    t.date "data_liberacao"
    t.date "data_confeccao"
    t.date "prazo_entrega"
    t.integer "status"
    t.date "data_envio"
    t.integer "tipo"
    t.string "cep"
    t.string "cidade"
    t.string "codigo_localizador"
    t.text "observacao"
    t.string "codigo"
    t.string "livro"
    t.string "folha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["aluno_id"], name: "index_certificados_on_aluno_id"
    t.index ["user_id"], name: "index_certificados_on_user_id"
  end

  create_table "certifications", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "cliente_id", null: false
    t.integer "aluno_id"
    t.integer "produto_id", null: false
    t.integer "number", null: false
    t.integer "book", null: false
    t.integer "sheet", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ce_id"
    t.date "end_date"
    t.string "student_class"
    t.integer "status", default: 1
    t.index ["ce_id"], name: "index_certifications_on_ce_id"
    t.index ["produto_id"], name: "index_certifications_on_produto_id"
    t.index ["user_id"], name: "index_certifications_on_user_id"
  end

  create_table "ces", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "cidade"
    t.string "uf"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chamadas", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "aluno_id"
    t.integer "user_id"
    t.integer "turmastaff_id"
    t.boolean "dia1"
    t.boolean "dia2"
    t.boolean "dia3"
    t.boolean "dia4"
    t.boolean "dia5"
    t.boolean "dia6"
    t.boolean "dia7"
    t.boolean "dia8"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["aluno_id"], name: "index_chamadas_on_aluno_id"
    t.index ["turmastaff_id"], name: "index_chamadas_on_turmastaff_id"
    t.index ["user_id"], name: "index_chamadas_on_user_id"
  end

  create_table "cidades", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "estado_id"
    t.string "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["estado_id"], name: "index_cidades_on_estado_id"
  end

  create_table "cities", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "id_estado", null: false
    t.string "uf", limit: 2, null: false
    t.string "estado", limit: 35, null: false
    t.integer "id_cidade", null: false
    t.string "cidade", limit: 50, null: false
    t.string "ddd", limit: 6, null: false
    t.string "latitude", limit: 180
    t.string "longitude", limit: 180
    t.string "region"
    t.integer "city_state_id"
    t.index ["city_state_id"], name: "ce_id"
  end

  create_table "class_interests", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "pedido_id"
    t.integer "user_id"
    t.integer "current_class_id"
    t.integer "target_class_id"
    t.text "note"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_class_interests_on_cliente_id"
    t.index ["pedido_id"], name: "index_class_interests_on_pedido_id"
    t.index ["user_id"], name: "index_class_interests_on_user_id"
  end

  create_table "cliente_emails", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "email", null: false
    t.integer "cliente_id", null: false
    t.string "kind", null: false
    t.boolean "main", default: false
    t.boolean "mailing", default: true
    t.index ["cliente_id", "email"], name: "index_cliente_emails_on_cliente_id_and_email"
    t.index ["email"], name: "index_cliente_emails_on_email", unique: true
    t.index ["main", "mailing"], name: "index_cliente_emails_on_main_and_mailing"
  end

  create_table "clientes", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.integer "sexo"
    t.date "data_nascimento"
    t.string "rg"
    t.string "cpf"
    t.string "naturalidade"
    t.integer "empresa_id"
    t.integer "profissao_id"
    t.integer "cargo_id"
    t.string "telefone01"
    t.string "telefone02"
    t.string "telefone03"
    t.string "email01"
    t.string "email02"
    t.string "skype"
    t.string "facebook"
    t.string "funil"
    t.text "observacoes", null: false
    t.string "nome_fantasia"
    t.string "razao_social"
    t.string "cnpj"
    t.string "inscricao_estadual"
    t.string "responsavel"
    t.integer "user_id"
    t.boolean "desativado", default: false
    t.integer "resposta01"
    t.integer "resposta02"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "tipo_endereco"
    t.string "endereco"
    t.string "complemento"
    t.string "ponto_referencia"
    t.string "bairro"
    t.string "cep"
    t.integer "ce_id"
    t.datetime "data_criacao"
    t.string "telefone_responsavel"
    t.string "email_responsavel"
    t.string "numero_registro_assessment"
    t.string "detalhe_resposta01"
    t.string "cidade"
    t.string "estado"
    t.integer "origem", default: 0
    t.integer "codezip"
    t.string "cowntry"
    t.string "state"
    t.string "city"
    t.string "address"
    t.string "district"
    t.string "tipo"
    t.string "nome_cracha"
    t.string "linkedin"
    t.string "twitter"
    t.boolean "responsavel_pagamento", default: false
    t.integer "tipo_cliente", default: 1
    t.string "documento_internacional"
    t.string "telefone01_internacional"
    t.string "telefone02_internacional"
    t.string "telefone03_internacional"
    t.boolean "politica_privacidade"
    t.string "telefone04"
    t.datetime "data_transferencia"
    t.boolean "inadimplente_externo", default: false
    t.boolean "inadimplente_interno", default: false
    t.text "detalhamento_inadimplente_externo"
    t.text "detalhamento_inadimplente_interno"
    t.string "emprego"
    t.string "ocupacao"
    t.string "funcao"
    t.integer "negativado_ibc"
    t.string "formacao_academica"
    t.string "estado_civil"
    t.integer "dependente"
    t.boolean "conjuge", default: false
    t.string "nome_conjuge"
    t.string "trabalho_conjuge"
    t.string "renda_mensal_conjuge"
    t.string "telefone_empresa"
    t.string "endereco_empresa"
    t.date "data_admissao"
    t.string "renda_principal"
    t.integer "forma_cadastro"
    t.integer "evento_id"
    t.string "conhecimento_evento"
    t.boolean "trainer", default: false
    t.integer "escolaridade"
    t.string "perfil_ca"
    t.text "descricao_atividades"
    t.integer "resposta_lead_01"
    t.integer "resposta_lead_02"
    t.integer "resposta_lead_03"
    t.string "email03"
    t.string "pessoa_confianca_nome"
    t.string "pessoa_confianca_telefone"
    t.text "justificativa_desativacao"
    t.integer "atendimento_id"
    t.integer "agente_recepcao_id"
    t.boolean "transferido_por_telefone"
    t.datetime "ultimo_contato"
    t.boolean "bound_to_vd", default: false, null: false
    t.boolean "ativo", default: true, null: false
    t.integer "categoria", default: 1
    t.integer "id_sankhya"
    t.boolean "newsletter", default: true
    t.integer "deactivation_reason"
    t.integer "author_id"
    t.boolean "exported", default: false
    t.datetime "export_date"
    t.integer "funnel_id"
    t.string "social_name"
    t.boolean "liberado_botmaker", default: false
    t.text "moodle_response"
    t.index ["agente_recepcao_id"], name: "index_clientes_on_agente_recepcao_id"
    t.index ["cargo_id"], name: "index_clientes_on_cargo_id"
    t.index ["categoria"], name: "index_clientes_on_categoria"
    t.index ["desativado"], name: "idx_clientes_desativado"
    t.index ["email01", "email02", "desativado", "email03"], name: "idx_clientes_email01_email02_desativado_email03"
    t.index ["email01"], name: "index_clientes_email01"
    t.index ["email02"], name: "index_clientes_email02"
    t.index ["email03"], name: "index_clientes_email03"
    t.index ["empresa_id"], name: "index_clientes_on_empresa_id"
    t.index ["nome", "email01", "email02", "email03"], name: "nome_email01_email02_email03"
    t.index ["profissao_id"], name: "index_clientes_on_profissao_id"
  end

  create_table "cms", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "conta"
    t.integer "tipo"
    t.integer "obj_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "ativo", default: true
  end

  create_table "cocs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "apelido"
    t.integer "banco_id"
    t.integer "bandeira_id"
    t.string "numero_cartao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "ativo", default: true
    t.index ["banco_id"], name: "index_cocs_on_banco_id"
    t.index ["bandeira_id"], name: "index_cocs_on_bandeira_id"
  end

  create_table "colaboradores", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.integer "sexo"
    t.integer "estado_civil"
    t.date "data_nascimento"
    t.string "cpf"
    t.string "rg"
    t.string "naturalidade"
    t.string "pai"
    t.string "mae"
    t.string "endereco"
    t.string "complemento"
    t.string "ponto_referencia"
    t.string "bairro"
    t.string "cep"
    t.integer "ce_id"
    t.text "observacoes"
    t.string "telefone01"
    t.string "telefone02"
    t.string "email01"
    t.string "email02"
    t.integer "cc_id"
    t.string "horario_trabalho"
    t.integer "escolaridade"
    t.string "pis_pasep"
    t.string "numero_registro"
    t.string "intervalo"
    t.string "titulo_eleitor"
    t.integer "quantidade_dependente"
    t.text "descricao_dependente"
    t.date "data_admissao"
    t.date "data_exame_admissional"
    t.date "data_max_ferias"
    t.date "data_primeira_avaliacao_prevista"
    t.date "data_primeira_avaliacao_realizada"
    t.date "data_segunda_avaliacao_prevista"
    t.date "data_segunda_avaliacao_realizada"
    t.text "observacao_primeira_avaliacao"
    t.text "observacao_segunda_avaliacao"
    t.date "data_inicio_ferias"
    t.date "data_fim_ferias"
    t.text "historico_ferias"
    t.date "data_demissao"
    t.boolean "ativo", default: true
    t.boolean "vale_transporte", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "curso"
    t.string "employee_picture"
    t.string "email"
    t.string "serie"
    t.date "data_emissao"
    t.integer "banco_id"
    t.integer "agencia"
    t.string "conta"
    t.string "orgao_expeditor"
    t.date "data_emissao_rg"
    t.string "zona"
    t.string "secao"
    t.date "data_emissao_titulo"
    t.string "local"
    t.integer "ctps"
    t.string "ficha_online_url"
    t.string "nome_completo"
    t.integer "tipo_usuario"
    t.decimal "salario", precision: 12, scale: 2
    t.date "data_max_exames"
    t.integer "unidade_id"
    t.index ["banco_id"], name: "index_colaboradores_on_banco_id"
  end

  create_table "comissoes", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "pedido_id"
    t.date "data_criacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "data_lancamento"
    t.decimal "porcentagem_comissao", precision: 12, scale: 2
    t.decimal "valor_comissao", precision: 12, scale: 2
    t.integer "user_id"
    t.boolean "ativo", default: true
    t.integer "mes"
    t.integer "ano"
    t.integer "financial_agent_id"
    t.index ["pedido_id"], name: "index_comissoes_on_pedido_id"
  end

  create_table "communication_action_items", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "communication_action_id"
    t.integer "aluno_id"
    t.string "job_id"
    t.string "status"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communication_actions", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "type", null: false
    t.integer "days_before_start"
    t.string "name"
    t.string "kind", null: false
    t.integer "communication_trail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communication_email_options", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body", size: :long, null: false
    t.string "subject"
    t.integer "communication_email_action_id"
  end

  create_table "communication_trails", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "concessoes", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "unidade_id", null: false
    t.integer "area_de_atuacao_id", null: false
    t.boolean "exclusividade", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["area_de_atuacao_id"], name: "index_concessoes_on_area_de_atuacao_id"
    t.index ["exclusividade"], name: "index_concessoes_on_exclusividade"
    t.index ["unidade_id"], name: "index_concessoes_on_unidade_id"
  end

  create_table "contacts", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "acquaintance_id"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contas", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "banco_id"
    t.string "agencia"
    t.string "conta"
    t.text "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "saldo_inicial", precision: 12, scale: 2
    t.string "apelido"
    t.boolean "ativo", default: true
    t.integer "id_sankhya", default: 0
    t.index ["banco_id"], name: "index_contas_on_banco_id"
  end

  create_table "contracts", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "pedido_id"
    t.text "body"
    t.boolean "accepted", default: false
    t.boolean "in_force", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_contracts_on_pedido_id"
  end

  create_table "coresults", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "codigo"
    t.string "nome"
    t.boolean "despesa"
    t.text "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "ativo", default: true
    t.boolean "recebe_lancamento", default: true
    t.integer "nivel"
    t.integer "subcategoria"
  end

  create_table "cps", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.date "data_lancamento"
    t.string "documento"
    t.text "descricao"
    t.date "data_vencimento"
    t.decimal "valor", precision: 12, scale: 2
    t.decimal "multa", precision: 12, scale: 2
    t.decimal "juros", precision: 12, scale: 2
    t.decimal "desconto", precision: 12, scale: 2
    t.decimal "valor_total", precision: 10
    t.date "data_recebimento"
    t.integer "portador"
    t.integer "cm_id"
    t.integer "situacao"
    t.text "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "quantidade_parcela"
    t.decimal "valor_parcela", precision: 12, scale: 2
    t.integer "coresult_id"
    t.integer "cc_id"
    t.boolean "pedido_ca"
    t.integer "quantidade_ca"
    t.boolean "lancamento"
    t.integer "credor_id"
    t.index ["cm_id"], name: "index_cps_on_cm_id"
  end

  create_table "credit_rules", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "credit_scale_id", null: false
    t.string "name", null: false
    t.integer "score_min", null: false
    t.integer "score_max", null: false
    t.integer "min_payment", null: false
    t.integer "min_first_installment", null: false
    t.string "color_hex", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "required_documents"
  end

  create_table "credit_scales", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "spc_update_interval"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "credores", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.integer "tipo"
    t.integer "obj_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crparceiros", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cr_id"
    t.integer "cliente_id"
    t.integer "cm_id"
    t.integer "pedido_id"
    t.integer "coresult_id"
    t.integer "cc_id"
    t.integer "bandeira_id"
    t.integer "banco_id"
    t.integer "empresa_id"
    t.integer "user_id"
    t.date "data_lancamento"
    t.text "documento"
    t.text "descricao"
    t.date "data_vencimento"
    t.decimal "valor", precision: 12, scale: 2
    t.decimal "multa", precision: 12, scale: 2
    t.decimal "juros", precision: 12, scale: 2
    t.decimal "desconto", precision: 12, scale: 2
    t.decimal "valor_total", precision: 12, scale: 2
    t.date "data_recebimento"
    t.integer "portador"
    t.integer "situacao"
    t.text "observacoes"
    t.string "numero_agencia"
    t.string "numero_conta"
    t.string "numero_autorizacao"
    t.integer "quantidade"
    t.boolean "ativo", default: true
    t.boolean "boolean", default: false
    t.boolean "alterar", default: true
    t.boolean "recibo", default: false
    t.date "data_reapresentacao"
    t.string "alinea"
    t.boolean "calcular_juros_multa", default: false
    t.date "data_cobranca_juros"
    t.integer "via_pagamento"
    t.boolean "confirmacao_pagamento", default: false
    t.decimal "valor_parcial", precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taxacartao_id"
    t.index ["banco_id"], name: "index_crparceiros_on_banco_id"
    t.index ["bandeira_id"], name: "index_crparceiros_on_bandeira_id"
    t.index ["cc_id"], name: "index_crparceiros_on_cc_id"
    t.index ["cliente_id"], name: "index_crparceiros_on_cliente_id"
    t.index ["cm_id"], name: "index_crparceiros_on_cm_id"
    t.index ["coresult_id"], name: "index_crparceiros_on_coresult_id"
    t.index ["cr_id"], name: "index_crparceiros_on_cr_id"
    t.index ["empresa_id"], name: "index_crparceiros_on_empresa_id"
    t.index ["pedido_id"], name: "index_crparceiros_on_pedido_id"
    t.index ["user_id"], name: "index_crparceiros_on_user_id"
  end

  create_table "crs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.date "data_lancamento"
    t.string "documento"
    t.text "descricao"
    t.integer "cliente_id"
    t.date "data_vencimento"
    t.decimal "valor", precision: 12, scale: 2
    t.decimal "multa", precision: 12, scale: 2
    t.decimal "juros", precision: 12, scale: 2
    t.decimal "desconto", precision: 12, scale: 2
    t.decimal "valor_total", precision: 12, scale: 2
    t.date "data_recebimento"
    t.integer "portador"
    t.integer "cm_id"
    t.integer "situacao"
    t.text "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "pedido_id"
    t.integer "coresult_id"
    t.integer "cc_id"
    t.string "numero_agencia"
    t.string "numero_conta"
    t.integer "bandeira_id"
    t.string "numero_autorizacao"
    t.integer "banco_id"
    t.integer "empresa_id"
    t.integer "quantidade"
    t.boolean "ativo", default: true
    t.boolean "alterar", default: true
    t.boolean "recibo", default: false
    t.date "data_reapresentacao"
    t.string "alinea"
    t.integer "user_id"
    t.boolean "calcular_juros_multa", default: false
    t.date "data_cobranca_juros"
    t.integer "via_pagamento"
    t.boolean "confirmacao_pagamento", default: false
    t.decimal "valor_parcial", precision: 12, scale: 2
    t.boolean "emitir_nota", default: false
    t.integer "numero_nota"
    t.integer "taxacartao_id"
    t.date "data_baixa"
    t.integer "parcela"
    t.integer "quant_parcelas"
    t.date "data_devolucao_cheques"
    t.integer "id_sankhya"
    t.boolean "renegotiated", default: false
    t.boolean "calculated_tax", default: false
    t.decimal "withheld_tax", precision: 12, scale: 2, default: "0.0", null: false
    t.string "tid"
    t.string "nsu"
    t.string "cnpj"
    t.string "authorization"
    t.string "last4digits"
    t.index ["cliente_id"], name: "index_crs_on_cliente_id"
    t.index ["cm_id"], name: "index_crs_on_cm_id"
    t.index ["pedido_id"], name: "fk_pedidos_crs_idx"
  end

  create_table "customer_portifolio_configurations", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reatbase_id"
    t.integer "coordinator_id"
    t.integer "lead_days_without_interaction"
    t.integer "customer_days_without_interaction"
    t.integer "reatbase_seller_to_manager_minutes"
    t.integer "reatbase_manager_to_coordinator_minutes"
    t.text "transfer_mail_interest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "lead_report_active", default: true
    t.boolean "reatbase_report_active", default: true
    t.index ["user_id"], name: "index_customer_portifolio_configurations_on_user_id"
  end

  create_table "customer_rewards", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "buzzlead_reward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_presences", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "attendance_control_id"
    t.boolean "presence", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "reference_day"
  end

  create_table "daily_trainers", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "facilitador_id"
    t.integer "event_expenses_analysis_id"
    t.integer "days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "total_value", precision: 12, scale: 2
  end

  create_table "decs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_corporativo"
    t.integer "user_demanda"
    t.date "data_registro"
    t.text "observacao"
    t.integer "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cliente_id"], name: "index_decs_on_cliente_id"
  end

  create_table "departamentos", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.integer "unidade_id"
    t.integer "gestor_id"
    t.boolean "ativo", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "descricao"
    t.index ["gestor_id"], name: "index_departamentos_on_gestor_id"
    t.index ["unidade_id"], name: "index_departamentos_on_unidade_id"
  end

  create_table "dunes", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "user_une"
    t.date "data_registro"
    t.text "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_demanda"
    t.index ["cliente_id"], name: "index_dunes_on_cliente_id"
  end

  create_table "duplicated_emails", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "email", null: false
    t.integer "cliente_id", null: false
    t.integer "cliente_email_id", null: false
    t.index ["email"], name: "index_duplicated_emails_on_email"
  end

  create_table "educational_leveis", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "email_templates", id: :integer, charset: "latin1", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
    t.text "body", size: :long, null: false
  end

  create_table "empresas", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome_fantasia"
    t.string "razao_social"
    t.string "cnpj"
    t.string "inscricao_estadual"
    t.string "responsavel"
    t.string "telefone01"
    t.string "telefone02"
    t.string "email"
    t.string "site"
    t.string "endereco"
    t.string "complemento"
    t.string "ponto_referencia"
    t.string "bairro"
    t.integer "ce_id"
    t.string "cep"
    t.text "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "cidade"
    t.string "estado"
    t.string "numero_registro_assessment"
    t.integer "cargo_id"
    t.integer "funil"
    t.boolean "inadimplente_externo", default: false
    t.boolean "inadimplente_interno", default: false
    t.text "detalhamento_inadimplente_externo"
    t.text "detalhamento_inadimplente_interno"
    t.date "data_fundacao"
    t.string "regime_tributacao"
    t.integer "negativado_ibc"
    t.integer "unidade_id"
    t.integer "id_sankhya"
    t.integer "tributacao"
    t.integer "natureza_juridica"
    t.integer "nationality", default: 1
    t.index ["ce_id"], name: "index_empresas_on_ce_id"
  end

  create_table "equipes", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.integer "responsavel_id"
    t.integer "departamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "ativa", default: true
    t.integer "team_type"
    t.index ["departamento_id"], name: "index_equipes_on_departamento_id"
    t.index ["responsavel_id"], name: "index_equipes_on_responsavel_id"
  end

  create_table "estados", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "sigla"
    t.string "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_expense_detaiis", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "expense_type_id"
    t.text "discrimination"
    t.float "unitary_value"
    t.float "quantity"
    t.string "unit"
    t.float "total"
    t.boolean "refundable"
    t.string "invoice_photo"
    t.integer "expense_detailable_id"
    t.string "expense_detailable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_detailable_id"], name: "index_event_expense_detaiis_on_expense_detailable_id"
  end

  create_table "event_expense_revenues", id: :integer, charset: "latin1", force: :cascade do |t|
    t.float "expected_revenue"
    t.float "realized_revenue"
    t.float "expected_expense"
    t.float "realized_expense"
    t.float "expected_expense_revenue"
    t.float "realized_expense_revenue"
    t.float "expense_per_student"
    t.integer "event_expenses_analysis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_expenses", id: :integer, charset: "latin1", force: :cascade do |t|
    t.float "trainer_rate"
    t.float "staff_daily_rate"
    t.float "hotel_expenses"
    t.float "structure_expenses"
    t.float "coffee_expenses"
    t.float "pass_expenses"
    t.float "courseware_expenses"
    t.float "ad_traffic_expenses"
    t.float "freight_cost"
    t.float "total"
    t.string "type"
    t.integer "event_expenses_analysis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "trainer_expenses"
  end

  create_table "event_expenses_analyses", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "turma_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eventoexternos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "tipo"
    t.string "nome"
    t.date "data_inicio"
    t.date "data_fim"
    t.string "hora_inicio"
    t.string "hora_fim"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "active", default: true, null: false
    t.index ["active"], name: "index_eventoexternos_on_active"
  end

  create_table "eventos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.text "brifing"
    t.date "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "presence_list"
    t.date "data_fim"
  end

  create_table "exams", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.text "feedback"
    t.float "grade"
    t.integer "status"
    t.datetime "submitted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cliente_id"
    t.integer "turma_id"
    t.index ["cliente_id"], name: "index_exams_on_cliente_id"
    t.index ["turma_id"], name: "index_exams_on_turma_id"
  end

  create_table "expense_types", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exports", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "department_id"
    t.text "export_type"
    t.integer "status"
    t.text "file_url"
    t.text "params"
    t.datetime "uploaded_at"
    t.text "export_reason"
    t.text "columns_to_export"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extra_hooks", charset: "latin1", force: :cascade do |t|
    t.integer "hook_id"
    t.string "hook_key"
    t.text "hook_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "facilitadores", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone01"
    t.string "telefone02"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "other_info"
    t.date "contract_date"
    t.date "birth_date"
    t.string "email2"
    t.integer "banco_id"
    t.boolean "active", default: true
    t.integer "trainer_category_id"
    t.decimal "daily_value", precision: 12, scale: 2
    t.index ["banco_id"], name: "index_facilitadores_on_banco_id"
  end

  create_table "faturamentos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "faturamento_inicio"
    t.string "faturamento_fim"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "fat_de", precision: 12, scale: 2
    t.decimal "fat_ate", precision: 12, scale: 2
  end

  create_table "ficha_incompanies", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "user_id"
    t.string "nome"
    t.string "nome_cracha"
    t.string "email01"
    t.date "data_nascimento"
    t.string "cpf"
    t.string "sexo"
    t.string "profissao"
    t.string "formacao_academica"
    t.string "cargo"
    t.string "tempo_empresa"
    t.string "superior_direto"
    t.string "numero_subordinado"
    t.string "cep"
    t.string "endereco"
    t.string "bairro"
    t.string "complemento"
    t.string "cidade"
    t.string "estado"
    t.string "codezip"
    t.string "cowntry"
    t.string "state"
    t.string "city"
    t.string "address"
    t.string "district"
    t.string "telefone01"
    t.string "telefone02"
    t.string "telefone03"
    t.text "anotacoes"
    t.text "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "descricao_atividades"
    t.index ["cliente_id"], name: "index_ficha_incompanies_on_cliente_id"
    t.index ["user_id"], name: "index_ficha_incompanies_on_user_id"
  end

  create_table "ficha_onlines", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.integer "sexo"
    t.string "nome_cracha"
    t.date "data_nascimento"
    t.string "rg"
    t.string "cpf"
    t.string "naturalidade"
    t.integer "empresa_id"
    t.integer "profissao_id"
    t.integer "cargo_id"
    t.string "telefone01"
    t.string "telefone02"
    t.string "telefone03"
    t.string "email01"
    t.string "email02"
    t.string "skype"
    t.string "facebook"
    t.string "twitter"
    t.string "linkedin"
    t.text "observacoes"
    t.integer "user_id"
    t.integer "tipo_endereco"
    t.string "endereco"
    t.string "complemento"
    t.string "ponto_referencia"
    t.string "bairro"
    t.string "cep"
    t.integer "ce_id"
    t.string "cidade"
    t.string "estado"
    t.integer "codezip"
    t.string "cowntry"
    t.string "state"
    t.string "city"
    t.string "address"
    t.string "district"
    t.boolean "politica_privacidade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "tipo"
    t.integer "cliente_id"
    t.integer "resposta01"
    t.integer "resposta02"
    t.string "detalhe_resposta01"
    t.string "telefone04"
    t.string "empresa_nome"
    t.string "profissao_nome"
    t.string "cargo_nome"
    t.string "emprego"
    t.string "ocupacao"
    t.string "funcao"
    t.integer "nacionalidade"
    t.string "documento_internacional"
    t.string "telefone_internacional_01"
    t.string "telefone_internacional_02"
    t.string "telefone_internacional_03"
    t.string "pessoa_confianca_nome"
    t.string "pessoa_confianca_telefone"
  end

  create_table "formations", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fornecedores", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome_fantasia"
    t.string "razao_social"
    t.string "cnpj"
    t.string "inscricao_estadual"
    t.string "responsavel"
    t.string "cpf"
    t.string "telefone01"
    t.string "telefone02"
    t.string "email"
    t.string "endereco"
    t.string "complemento"
    t.string "ponto_referencia"
    t.string "bairro"
    t.string "cep"
    t.integer "ce_id"
    t.text "observacoes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "nome_completo"
    t.integer "sexo"
    t.date "data_nascimento"
    t.string "cpf_pf"
    t.string "rg"
    t.string "naturalidade"
    t.string "pai"
    t.string "mãe"
    t.index ["ce_id"], name: "index_fornecedores_on_ce_id"
  end

  create_table "funcoes", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funnels", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "stage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grupouser_remanejamentos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "grupouser_id"
    t.integer "solicitante_id"
    t.integer "user_id"
    t.boolean "remanejamento_concluido", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["grupouser_id"], name: "index_grupouser_remanejamentos_on_grupouser_id"
    t.index ["solicitante_id"], name: "index_grupouser_remanejamentos_on_solicitante_id"
    t.index ["user_id"], name: "index_grupouser_remanejamentos_on_user_id"
  end

  create_table "grupousers", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "tipo"
    t.integer "user_id"
    t.date "data"
    t.string "responsavel"
    t.integer "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cliente_id"], name: "index_grupousers_on_cliente_id"
    t.index ["user_id"], name: "index_grupousers_on_user_id"
  end

  create_table "histcargos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "funcao_id"
    t.integer "colaborador_id"
    t.date "data_inicio"
    t.date "data_fim"
    t.decimal "salario", precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["funcao_id"], name: "index_histcargos_on_funcao_id"
  end

  create_table "histnegociacaopedidos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.text "detalhadamento_negociacao"
    t.integer "user_id"
    t.date "data_registro"
    t.integer "pedido_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["pedido_id"], name: "index_histnegociacaopedidos_on_pedido_id"
    t.index ["user_id"], name: "index_histnegociacaopedidos_on_user_id"
  end

  create_table "histories", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "historyable_id"
    t.string "historyable_type"
    t.text "observation"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind"
  end

  create_table "histpedidos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "motivo"
    t.date "data_registro"
    t.string "de_quem"
    t.string "para_quem"
    t.integer "pedido_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["pedido_id"], name: "index_histpedidos_on_pedido_id"
    t.index ["user_id"], name: "index_histpedidos_on_user_id"
  end

  create_table "histtickets", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.date "data_prevista"
    t.string "tempo_estimado"
    t.date "data_fechamento"
    t.string "dificuldade"
    t.text "observacao"
    t.string "status"
    t.integer "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.string "ticket_attachment"
    t.index ["ticket_id"], name: "index_histtickets_on_ticket_id"
  end

  create_table "hooks", charset: "latin1", force: :cascade do |t|
    t.string "email"
    t.string "event"
    t.integer "timestamp"
    t.string "message_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hoteis", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome_hotel"
    t.string "cep"
    t.string "endereco"
    t.integer "ce_id"
    t.integer "tipo"
    t.integer "categoria"
    t.boolean "estacionamento"
    t.integer "quantidade_vagas_carro"
    t.integer "valor_estacionamento"
    t.string "site"
    t.text "observacoes"
    t.string "nome_contato01"
    t.string "nome_contato02"
    t.string "email01"
    t.string "email02"
    t.string "telefone01"
    t.string "telefone02"
    t.integer "cargo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "complemento"
    t.string "bairro"
    t.string "ponto_referencia"
    t.text "observacoes_estacionamento"
    t.text "observacoes_contato"
    t.string "razao_social"
    t.string "cnpj"
    t.string "inscricao_estadual"
    t.string "estacionamento_valor"
    t.string "valor_diaria_single"
    t.string "valor_diaria_duplo"
    t.string "valor_diaria_triplo"
    t.integer "room_capacity"
  end

  create_table "ibc_payment_requests", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "tid"
    t.string "pedido"
    t.string "valor"
    t.string "data"
    t.string "bandeira"
    t.string "forma_pagamento"
    t.string "status"
    t.boolean "processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reference"
    t.string "nsu"
    t.string "cnpj"
    t.string "authorization"
    t.string "last4digits"
  end

  create_table "ibcommerce_assessments", id: :integer, charset: "latin1", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "turma_id"
    t.integer "facilitador_id"
    t.integer "motivo_desconto"
    t.integer "quantity_parcel"
    t.string "link"
    t.string "slug"
    t.string "nickname"
    t.integer "quantity"
    t.float "value_cash"
    t.float "value_parcel"
    t.index ["slug"], name: "index_ibcommerce_assessments_on_slug", unique: true
  end

  create_table "ibcommerce_dsps", id: :integer, charset: "latin1", force: :cascade do |t|
    t.float "premium_01_cash"
    t.float "premium_02_cash"
    t.float "premium_03_cash"
    t.float "premium_01_parcel"
    t.float "premium_02_parcel"
    t.float "premium_03_parcel"
    t.float "vip_01_cash"
    t.float "vip_02_cash"
    t.float "vip_03_cash"
    t.float "vip_01_parcel"
    t.float "vip_02_parcel"
    t.float "vip_03_parcel"
    t.boolean "active"
    t.integer "turma_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ibcommerce_ibc_dsps", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "ibcommerce_ibc_dsps_group_id"
    t.integer "produto_id"
    t.integer "turma_id"
    t.boolean "active"
    t.float "value"
    t.float "value_parcel"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ibcommerce_ibc_dsps_groups", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ibcommerce_partners", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "ibcommerce_partners_group_id"
    t.integer "produto_id"
    t.integer "turma_id"
    t.boolean "active"
    t.float "value"
    t.float "value_parcel"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ibcommerce_partners_group_id"], name: "index_ibcommerce_partners_on_ibcommerce_partners_group_id"
    t.index ["produto_id"], name: "index_ibcommerce_partners_on_produto_id"
    t.index ["turma_id"], name: "index_ibcommerce_partners_on_turma_id"
  end

  create_table "ibcommerce_partners_groups", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "description"
    t.boolean "active"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ibcommerce_partners_groups_on_user_id"
  end

  create_table "ibcommerce_promo_hist_products", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.integer "ibcommerce_promo_hist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ibcommerce_promo_hists", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer "promo_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ibcommerce_promos", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "produto_id", null: false
    t.float "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "turma_id"
    t.string "description"
    t.integer "promo_group_id"
    t.float "value_parcel"
  end

  create_table "ibcommerce_pscs", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "turma_id"
    t.boolean "active"
    t.float "value"
    t.float "value_parcel"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ibcommerce_pscs_group_id"
    t.integer "produto_id"
  end

  create_table "ibcommerce_pscs_groups", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "importarclientes", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "spreadsheet"
    t.integer "user_id"
    t.text "interacao"
    t.integer "origem"
  end

  create_table "interacao_parcerias", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cliente_id"
    t.integer "empresa_id"
    t.integer "acao_parceria_id"
    t.text "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["acao_parceria_id"], name: "index_interacao_parcerias_on_acao_parceria_id"
    t.index ["cliente_id"], name: "index_interacao_parcerias_on_cliente_id"
    t.index ["empresa_id"], name: "index_interacao_parcerias_on_empresa_id"
    t.index ["user_id"], name: "index_interacao_parcerias_on_user_id"
  end

  create_table "interacaocats", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "cliente_id"
    t.date "data_contato"
    t.text "ocorrencia"
    t.date "proxima_data"
    t.string "proximo_horario"
    t.integer "proxima_acao"
    t.integer "acao_realizada"
    t.integer "user_id"
    t.boolean "agendar"
    t.integer "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "classificacao", null: false
    t.index ["cliente_id"], name: "index_interacaocats_on_cliente_id"
    t.index ["empresa_id"], name: "index_interacaocats_on_empresa_id"
  end

  create_table "interacaocertificacoes", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cliente_id"
    t.text "observacao"
    t.date "data_registro"
    t.integer "user_id"
    t.integer "acao"
    t.string "outros"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "turma_id"
    t.integer "aluno_id"
    t.integer "empresa_id"
    t.index ["cliente_id"], name: "index_interacaocertificacoes_on_cliente_id"
    t.index ["user_id"], name: "index_interacaocertificacoes_on_user_id"
  end

  create_table "interacaocorporativos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cliente_id"
    t.date "data_contato"
    t.integer "funil"
    t.text "ocorrencia"
    t.date "proxima_data"
    t.integer "proxima_acao"
    t.integer "user_id"
    t.boolean "executado", default: false
    t.integer "acao_realizada"
    t.boolean "agendar"
    t.integer "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "proximo_horario"
    t.index ["cliente_id"], name: "index_interacaocorporativos_on_cliente_id"
    t.index ["empresa_id"], name: "index_interacaocorporativos_on_empresa_id"
    t.index ["user_id"], name: "index_interacaocorporativos_on_user_id"
  end

  create_table "interacaoeventos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "acao"
    t.date "data_criacao"
    t.integer "user_id"
    t.text "observacao"
    t.integer "evento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cliente_id"], name: "index_interacaoeventos_on_cliente_id"
    t.index ["evento_id"], name: "index_interacaoeventos_on_evento_id"
    t.index ["user_id"], name: "index_interacaoeventos_on_user_id"
  end

  create_table "interacaofinancs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cliente_id"
    t.date "data_contato"
    t.integer "acao_realizada"
    t.date "proxima_data"
    t.text "ocorrencia"
    t.string "proximo_horario"
    t.integer "proxima_acao"
    t.integer "user_id"
    t.boolean "executado", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "restrito", default: false
    t.integer "empresa_id"
    t.string "cnpj"
    t.string "cpf"
    t.boolean "aprovado", default: false
    t.boolean "agendar", default: false
    t.boolean "emitir_nota", default: false
    t.index ["cliente_id"], name: "idx_interacaofinancs_cliente_id"
  end

  create_table "interacaopvs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cliente_id"
    t.date "data_contato"
    t.integer "acao_realizada"
    t.date "proxima_data"
    t.text "ocorrencia"
    t.string "proximo_horario"
    t.integer "proxima_acao"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "executado", default: false
    t.string "outros"
    t.integer "empresa_id"
    t.string "file_attachment"
    t.index ["cliente_id"], name: "idx_interacaopvs_cliente_id"
  end

  create_table "interacaorecepcoes", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "user_id"
    t.date "data_contato"
    t.text "observacao"
    t.integer "cliente_id"
    t.integer "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "consultor_antigo"
    t.boolean "transferido_por_telefone"
    t.integer "origem"
    t.index ["cliente_id"], name: "index_interacaorecepcoes_on_cliente_id"
    t.index ["empresa_id"], name: "index_interacaorecepcoes_on_empresa_id"
    t.index ["transferido_por_telefone"], name: "index_interacaorecepcoes_on_transferido_por_telefone"
    t.index ["user_id"], name: "index_interacaorecepcoes_on_user_id"
  end

  create_table "interacaostaffs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "acao_realizada"
    t.integer "user_id"
    t.date "data_contato"
    t.text "ocorrencia"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "empresa_id"
    t.index ["cliente_id"], name: "index_interacaostaffs_on_cliente_id"
    t.index ["user_id"], name: "index_interacaostaffs_on_user_id"
  end

  create_table "interacaoturmas", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "turma_id"
    t.integer "status"
    t.text "observacao"
    t.integer "user_id"
    t.date "data_criacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "turmapv_id"
    t.integer "turmastaff_id"
    t.integer "acao"
    t.string "email"
    t.index ["turma_id"], name: "index_interacaoturmas_on_turma_id"
    t.index ["user_id"], name: "index_interacaoturmas_on_user_id"
  end

  create_table "interacoes", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cliente_id"
    t.date "data_contato"
    t.integer "funil"
    t.text "ocorrencia"
    t.date "proxima_data"
    t.string "proximo_horario"
    t.integer "proxima_acao"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "executado", default: false
    t.boolean "responsavel_pagamento", default: false
    t.integer "acao_realizada"
    t.boolean "agendar", default: false
    t.integer "empresa_id"
    t.string "file_attachment"
    t.index ["cliente_id"], name: "index_interacoes_on_cliente_id"
    t.index ["proxima_data", "proximo_horario", "agendar"], name: "interacoes_proxima_data_proximo_horario_agendar"
  end

  create_table "interaction_actions", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.index ["title"], name: "index_interaction_actions_on_title", unique: true
  end

  create_table "interaction_kind_actions", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "interaction_kind_id"
    t.integer "interaction_action_id"
    t.index ["interaction_kind_id", "interaction_action_id"], name: "index_interaction_kind_action_ids", unique: true
  end

  create_table "interaction_kinds", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.text "metadata"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.integer "equipe_id"
    t.index ["title"], name: "index_interaction_kinds_on_title", unique: true
  end

  create_table "interactions", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "interactable_id"
    t.string "interactable_type"
    t.integer "interaction_kind_id"
    t.integer "interaction_action_id"
    t.integer "user_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.integer "aluno_id"
    t.index ["interactable_id", "interactable_type"], name: "index_interactions_on_interactable_id_and_interactable_type"
    t.index ["interaction_action_id"], name: "index_interactions_on_interaction_action_id"
    t.index ["interaction_kind_id"], name: "index_interactions_on_interaction_kind_id"
    t.index ["user_id"], name: "index_interactions_on_user_id"
  end

  create_table "invalid_emails", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "email"
    t.text "invalid_reason"
    t.integer "cliente_id", null: false
    t.index ["cliente_id"], name: "index_invalid_emails_on_cliente_id"
  end

  create_table "itens", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "produto_id"
    t.integer "quantidade"
    t.decimal "valor", precision: 12, scale: 2
    t.integer "desconto"
    t.decimal "valor_desconto", precision: 12, scale: 2
    t.decimal "valor_total", precision: 12, scale: 2
    t.decimal "valor_sem_desconto", precision: 12, scale: 2
    t.integer "pedido_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "cortesia", default: false
    t.integer "user_id"
    t.integer "id_sankhya"
    t.integer "plataforma"
    t.integer "seller_id"
    t.integer "turma_id"
    t.float "total_value_parcel"
    t.index ["pedido_id"], name: "index_itens_on_pedido_id"
    t.index ["produto_id"], name: "index_itens_on_produto_id"
  end

  create_table "link_direcionamento_leads", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "arg_type", null: false
    t.string "arg_value", null: false
    t.integer "consultor_id"
    t.integer "creator_id", null: false
    t.boolean "active", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "interessados"
    t.index ["active"], name: "index_link_direcionamento_leads_on_active"
    t.index ["consultor_id"], name: "index_link_direcionamento_leads_on_consultor_id"
    t.index ["creator_id"], name: "index_link_direcionamento_leads_on_creator_id"
  end

  create_table "links_users", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "link_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["link_id"], name: "index_links_users_on_link_id"
    t.index ["user_id"], name: "index_links_users_on_user_id"
  end

  create_table "listaccs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "turma_id"
    t.integer "aluno01"
    t.integer "aluno02"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["turma_id"], name: "index_listaccs_on_turma_id"
  end

  create_table "paramcomissoes", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "tipo"
    t.string "porcentagem"
    t.integer "faturamento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "faturamento_nome"
    t.decimal "porcentagem_decimal", precision: 12, scale: 2
    t.index ["faturamento_id"], name: "index_paramcomissoes_on_faturamento_id"
  end

  create_table "parcelas", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "pedido_id"
    t.integer "cliente_id"
    t.decimal "valor_total", precision: 12, scale: 2
    t.integer "quantidade"
    t.decimal "valor_parcela", precision: 12, scale: 2
    t.integer "forma_pagamento"
    t.date "data_vencimento"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "empresa_id"
    t.index ["cliente_id"], name: "index_parcelas_on_cliente_id"
    t.index ["pedido_id"], name: "index_parcelas_on_pedido_id"
  end

  create_table "pedidos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "user_id"
    t.string "codigo"
    t.decimal "valor_sem_desconto", precision: 12, scale: 2
    t.integer "desconto"
    t.decimal "valor_desconto", precision: 12, scale: 2
    t.decimal "valor_total", precision: 12, scale: 2
    t.text "observacoes"
    t.integer "status"
    t.decimal "valor_total_parcela", precision: 12, scale: 2
    t.integer "motivo_desconto"
    t.text "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "data_venda"
    t.boolean "pedido_ca"
    t.text "observacao_cancelamento"
    t.integer "motivo_cancelamento"
    t.text "detalhamento_negociacao"
    t.boolean "enviar_email", default: true
    t.string "attachment"
    t.date "data_validade_ca"
    t.boolean "pedido_incompany", default: false
    t.integer "empresa_id"
    t.date "data_suspensao"
    t.text "observacao_pagamento"
    t.boolean "reenviar_ordem_pagamento", default: false
    t.boolean "comissionado", default: false
    t.boolean "pedido_parceiro", default: false
    t.integer "responsavel_recebimento"
    t.integer "unidade_id"
    t.date "data_comissionamento"
    t.integer "id_sankhya"
    t.integer "evento_fev_id"
    t.string "sale_form"
    t.string "payment_order_id"
    t.boolean "in_cancellation_process", default: false
    t.boolean "shared_sale", default: false, null: false
    t.integer "suspend_user_id"
    t.integer "card_number"
    t.integer "facilitador_id"
    t.integer "turma_id"
    t.decimal "freight_cost", precision: 12, scale: 2, default: "0.0"
    t.string "cif_fob"
    t.boolean "commissionable", default: true
    t.integer "substitute_order_id"
    t.integer "coordinator_id"
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
    t.index ["user_id"], name: "index_pedidos_on_user_id"
  end

  create_table "pins", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "produto_id"
    t.integer "prioridade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "ce_id"
    t.integer "funil"
    t.date "data_registro"
    t.integer "user_id"
    t.index ["cliente_id"], name: "index_pins_on_cliente_id"
    t.index ["produto_id"], name: "index_pins_on_produto_id"
  end

  create_table "portal_conference_uris", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "url"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "portal_ticket_id"
  end

  create_table "portal_tickets", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "conference_url"
    t.string "files_url"
    t.string "audio_url"
    t.string "telegram_url"
    t.string "pitch_url"
    t.integer "turma_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "has_upload"
    t.integer "attachments_number"
    t.integer "communication_email_options_id", null: false
    t.integer "max_student"
    t.boolean "reset_password"
    t.string "link_certification"
    t.index ["turma_id"], name: "index_portal_tickets_on_turma_id"
  end

  create_table "portfolios", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "unidade_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portfolios_produtos", id: false, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "portfolio_id"
    t.integer "produto_id"
  end

  create_table "prepedidos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "pedido_id"
    t.integer "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "finalizado", default: false
    t.integer "empresa_id"
    t.index ["cliente_id"], name: "index_prepedidos_on_cliente_id"
    t.index ["pedido_id"], name: "index_prepedidos_on_pedido_id"
  end

  create_table "product_assessments", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "turma_id"
    t.integer "produto_id"
    t.integer "ibcommerce_assessment_id"
    t.text "subtitle"
    t.integer "quantity_credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "classification"
    t.float "value_cash"
    t.float "value_parcel"
  end

  create_table "produtos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "codigo"
    t.string "nome"
    t.integer "desconto_max", default: 0
    t.decimal "valor", precision: 12, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "numero_dias"
    t.integer "tipo"
    t.decimal "custo_parceiro", precision: 12, scale: 2
    t.integer "classificacao"
    t.integer "id_sankhya"
    t.boolean "formacao_online", default: false, null: false
    t.string "abreviatura"
    t.integer "treinamento_id_sankhya"
    t.integer "buzzlead_id"
    t.integer "leads_conversion_rate"
    t.string "image"
    t.string "color", default: "#22527B"
    t.integer "service_type"
    t.integer "ged_deadline"
    t.integer "ged_concept_reduction_deadline"
    t.integer "ged_with_fee_deadline"
    t.integer "ged_support_deadline"
    t.string "link_ebook"
    t.integer "modality"
    t.integer "category"
    t.integer "hours_presential"
    t.integer "hours_online"
    t.integer "hours_ead"
    t.integer "activity_additional"
    t.integer "hours_total"
    t.text "bonus"
    t.integer "period_access"
    t.text "material_delivered"
    t.text "certification"
    t.string "link_order"
    t.text "observation"
    t.text "schedule_id"
    t.integer "ibcommerce_assessment_id"
    t.integer "workload"
    t.boolean "certification_work"
    t.integer "certification_type"
    t.string "titles"
    t.string "stamp"
  end

  create_table "produtos_staffs", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "staff_id"
    t.integer "produto_id"
    t.index ["produto_id"], name: "index_produtos_staffs_on_produto_id"
    t.index ["staff_id", "produto_id"], name: "index_produtos_staffs_on_staff_id_and_produto_id"
  end

  create_table "professional_activity_types", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professional_roles", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profissoes", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promo_groups", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", id: :integer, charset: "latin1", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_survey_id"
    t.integer "response_type"
  end

  create_table "rd_conversions", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "rd_lead_data_id"
    t.text "content"
    t.datetime "created_at"
    t.string "cumulative_sum"
    t.string "source"
    t.text "conversion_origin"
    t.index ["cliente_id"], name: "index_rd_conversions_on_cliente_id"
  end

  create_table "rd_custom_fields", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "rd_lead_data_id"
    t.text "content"
    t.datetime "created_at"
    t.index ["cliente_id"], name: "index_rd_custom_fields_on_cliente_id"
  end

  create_table "rd_customers", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "customer_id"
    t.string "customer_type"
    t.integer "pedido_id"
    t.string "action"
    t.boolean "processed", default: false
    t.integer "tries", default: 0
    t.string "tag"
    t.integer "funnel_option"
    t.text "error"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rd_lead_data", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "rd_lead_id"
    t.string "name"
    t.string "company"
    t.string "job_title"
    t.string "bio"
    t.string "public_url"
    t.datetime "created_at"
    t.boolean "opportunity"
    t.string "number_conversions"
    t.string "user"
    t.string "website"
    t.string "personal_phone"
    t.string "mobile_phone"
    t.string "city"
    t.string "state"
    t.string "lead_stage"
    t.text "tags"
    t.string "fit_score"
    t.string "interest"
    t.string "email"
    t.index ["cliente_id"], name: "index_rd_lead_datas_on_cliente_id"
    t.index ["email"], name: "email_UNIQUE", unique: true
  end

  create_table "reclamacaos", charset: "latin1", force: :cascade do |t|
    t.string "texto"
    t.string "message_id"
    t.string "history_id"
    t.integer "position"
    t.string "reclamacao_owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id"], name: "index_reclamacaos_on_message_id", unique: true
  end

  create_table "referrals", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "referred_id", null: false
    t.string "referrer", null: false
    t.boolean "processed", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registration_forms", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "customer_kind"
    t.integer "user_id"
    t.string "company_social_name"
    t.string "company_fantasy_name"
    t.string "cnpj"
    t.string "state_registration"
    t.string "company_person_name"
    t.string "company_web_site"
    t.integer "nationality"
    t.integer "gender"
    t.string "badge"
    t.string "document"
    t.string "document_shipping_agency"
    t.date "birthdate"
    t.string "cpf"
    t.string "cell_phone"
    t.string "landline"
    t.string "additional_phone"
    t.string "email"
    t.string "reliable_person_name"
    t.string "reliable_person_phone"
    t.string "company_name"
    t.string "personal_income"
    t.string "professional_activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "social_name"
    t.string "hometown"
    t.string "educational_level"
    t.string "formation"
    t.string "role"
    t.integer "legal_nature"
    t.integer "tax_regime"
  end

  create_table "regras", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.string "parametro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relatccs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.date "data_lancamento"
    t.date "data_baixa"
    t.integer "cm_id"
    t.integer "coresult_id"
    t.string "numero_documento"
    t.text "descricao"
    t.decimal "valor_receita", precision: 12, scale: 2
    t.decimal "valor_despesa", precision: 12, scale: 2
    t.integer "cc_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "credor_nome"
    t.integer "tipo"
  end

  create_table "relatremanejamentos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "aluno_id"
    t.integer "turmapv_ant"
    t.integer "turmapv_nova"
    t.date "data_remanejamento"
    t.integer "motivo_remanejamento"
    t.text "observacao_remanejamento"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "boleto", default: false
    t.index ["aluno_id"], name: "index_relatremanejamentos_on_aluno_id"
    t.index ["user_id"], name: "index_relatremanejamentos_on_user_id"
  end

  create_table "request_logs", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "source"
    t.string "destination"
    t.text "request_args"
    t.text "response_body"
    t.integer "response_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "turma_id"
    t.string "color"
  end

  create_table "requirements_produtos", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "turma_id"
    t.integer "requirement_id"
  end

  create_table "retornopagamentoonlines", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "tid"
    t.string "pan"
    t.integer "numero"
    t.decimal "valor", precision: 10
    t.string "moeda"
    t.date "data"
    t.string "bandeira"
    t.string "forma_pagamento"
    t.integer "parcelas"
    t.string "status"
    t.string "url_recibo"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "id_parcela"
  end

  create_table "roles", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "nome"
    t.string "label"
    t.string "descricao"
    t.string "grupo_roles"
    t.integer "posicao"
    t.boolean "requer_login"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["grupo_roles"], name: "index_roles_on_grupo_roles"
    t.index ["nome"], name: "index_roles_on_nome"
  end

  create_table "sankhya_integration_error_logs", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "sankhya_api_action", null: false
    t.string "sankhya_request_action", null: false
    t.string "error_message", null: false
    t.integer "sankhya_integration_id", null: false
  end

  create_table "send_grid_maiis", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "to"
    t.string "subject"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "send_grid_statuses", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "email"
    t.string "smtp_id"
    t.string "event"
    t.string "category"
    t.string "sg_event_id"
    t.string "sg_message_id"
    t.string "response"
    t.integer "attempt"
    t.string "useragent"
    t.string "ip"
    t.string "url"
    t.string "reason"
    t.string "status"
    t.integer "asm_group_id"
    t.integer "mail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mail_id"], name: "index_send_grid_statuses_on_mail_id"
  end

  create_table "servico_tickets", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "nome"
    t.integer "prazo_minimo"
    t.integer "prazo_maximo"
    t.integer "equipe_id"
    t.boolean "ativo", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["equipe_id"], name: "index_servico_tickets_on_equipe_id"
  end

  create_table "sessions", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id"
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "solicitacoes", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "servico"
    t.integer "situacao"
    t.text "descricao"
    t.integer "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "departamento_id"
    t.integer "empresa_id"
    t.string "ticket_attachment"
    t.integer "aluno_id"
    t.date "pendency_end_date"
    t.string "order_code"
    t.string "order_price"
    t.integer "payment_value"
    t.integer "pedido_id"
    t.index ["aluno_id"], name: "index_solicitacoes_on_aluno_id"
    t.index ["cliente_id"], name: "index_solicitacoes_on_cliente_id"
    t.index ["user_id"], name: "index_solicitacoes_on_user_id"
  end

  create_table "spc_data", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cliente_id"
    t.integer "user_id"
    t.integer "empresa_id"
  end

  create_table "staff_payment_detaiis", id: :integer, charset: "latin1", force: :cascade do |t|
    t.float "daily_rate"
    t.integer "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone01"
    t.string "telefone02"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "tipo_staff"
    t.integer "sexo"
    t.date "data_nascimento"
    t.string "rg"
    t.string "cpf"
    t.boolean "ativo"
    t.decimal "daily_value", precision: 12, scale: 2
  end

  create_table "survey_monkey_choices", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "question_id"
    t.string "text"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "survey_monkey_id"
    t.float "count"
    t.index ["question_id"], name: "index_survey_monkey_choices_on_question_id"
  end

  create_table "survey_monkey_collectores", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "survey_id"
    t.string "type"
    t.string "name"
    t.datetime "close_date"
    t.boolean "display_survey_results"
    t.integer "survey_monkey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "url"
    t.index ["survey_id"], name: "index_survey_monkey_collectores_on_survey_id"
  end

  create_table "survey_monkey_headings", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "heading"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "survey_monkey_id"
    t.index ["question_id"], name: "index_survey_monkey_headings_on_question_id"
  end

  create_table "survey_monkey_pages", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "position"
    t.string "href"
    t.integer "survey_monkey_id"
    t.integer "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_survey_monkey_pages_on_survey_id"
  end

  create_table "survey_monkey_questions", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "position"
    t.string "family"
    t.string "subtype"
    t.boolean "forced_ranking"
    t.integer "survey_monkey_id"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "heading"
    t.float "detratores"
    t.float "promotores"
    t.float "neutros"
    t.float "nps"
    t.float "answered"
    t.index ["page_id"], name: "index_survey_monkey_questions_on_page_id"
  end

  create_table "survey_monkey_response_answers", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "response_id"
    t.string "page_survey_monkey_id"
    t.string "question_survey_monkey_id"
    t.string "choice_id"
    t.string "text", limit: 3000, collation: "utf8_general_ci"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_survey_monkey_response_answers_on_response_id"
  end

  create_table "survey_monkey_responses", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "survey_id"
    t.string "survey_monkey_id"
    t.string "href"
    t.integer "total_time"
    t.string "custom_value"
    t.string "edit_url"
    t.string "analyze_url"
    t.string "ip_address"
    t.integer "aluno_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aluno_id"], name: "index_survey_monkey_responses_on_aluno_id"
    t.index ["survey_id"], name: "index_survey_monkey_responses_on_survey_id"
  end

  create_table "survey_monkey_rollups", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "question_id"
    t.string "survey_monkey_id"
    t.string "href"
    t.integer "answered"
    t.integer "skipped"
    t.integer "min"
    t.integer "max"
    t.float "mean"
    t.float "std"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_survey_monkey_rollups_on_question_id"
    t.index ["survey_monkey_id"], name: "index_survey_monkey_rollups_on_survey_monkey_id"
  end

  create_table "survey_monkey_surveys", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "survey_monkey_id"
    t.string "title"
    t.string "nickname"
    t.string "href"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language"
    t.integer "turma_id"
    t.string "survey_type"
    t.datetime "last_update"
  end

  create_table "surveys", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "surveyable_id"
    t.string "surveyable_type"
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "observation"
    t.boolean "approved"
    t.float "average"
  end

  create_table "ticket_interessados", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["ticket_id"], name: "index_ticket_interessados_on_ticket_id"
    t.index ["user_id"], name: "index_ticket_interessados_on_user_id"
  end

  create_table "ticket_responsaveis", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "ticket_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "solicitante"
    t.string "departamento"
    t.integer "prioridade"
    t.date "data_abertura"
    t.string "assunto"
    t.text "descricao"
    t.integer "atendente"
    t.date "data_fechamento"
    t.integer "dificuldade"
    t.text "observacao"
    t.integer "status"
    t.integer "user_id"
    t.integer "regra_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "tipo"
    t.date "data_prevista"
    t.string "tempo_estimado"
    t.string "ticket_attachment"
    t.integer "usuario"
    t.integer "cliente_id"
    t.string "ramal"
    t.string "avisar"
    t.boolean "delta", default: true, null: false
    t.integer "aluno_id"
    t.integer "servico_ticket_id"
    t.integer "departamento_id"
    t.integer "equipe_id"
    t.integer "departamento_de_origem_id"
    t.integer "equipe_de_origem_id"
    t.index ["regra_id"], name: "index_tickets_on_regra_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "tinymce_images", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "alt"
    t.string "hint"
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trabalhos", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "attachment"
    t.integer "tipo"
    t.boolean "ativo", default: true
  end

  create_table "trainer_categories", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainer_habilities", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "produto_id"
    t.integer "category_product_id"
    t.index ["produto_id", "category_product_id"], name: "index_trainer_habilities_on_produto_id_and_category_product_id"
  end

  create_table "trainer_metrics", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "minimum"
    t.integer "maximum"
    t.decimal "value", precision: 10
    t.integer "trainer_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "kind"
  end

  create_table "transferencias_leads_recepcao", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "cliente_id"
    t.integer "agente_id"
    t.integer "consultor_id"
    t.integer "ex_consultor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cliente_id"], name: "index_transferencias_leads_recepcao_on_cliente_id"
    t.index ["consultor_id"], name: "index_transferencias_leads_recepcao_on_consultor_id"
    t.index ["ex_consultor_id"], name: "index_transferencias_leads_recepcao_on_ex_consultor_id"
  end

  create_table "tratamento_solicitacoes", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "solicitacao_id"
    t.text "observacao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "situacao"
    t.string "tempo_atendimento"
    t.string "ticket_attachment"
    t.date "pendency_end_date"
    t.integer "reason"
    t.boolean "ressalva", default: false
    t.index ["solicitacao_id"], name: "index_tratamento_solicitacoes_on_solicitacao_id"
    t.index ["user_id"], name: "index_tratamento_solicitacoes_on_user_id"
  end

  create_table "tray_addresses", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "tray_id"
    t.integer "tray_customer_id"
    t.string "address"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "country"
    t.integer "address_type"
    t.integer "active"
    t.string "description"
    t.string "recipient"
    t.integer "type_delivery"
    t.integer "not_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tray_config_params", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tray_customers", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "cnpj"
    t.integer "tray_id"
    t.string "name"
    t.string "rg"
    t.string "cpf"
    t.string "phone"
    t.string "cellphone"
    t.date "birth_date"
    t.integer "gender"
    t.string "email"
    t.string "token"
    t.integer "customer_type"
    t.string "company_name"
    t.string "state_inscription"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tray_itens", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "tray_id"
    t.string "name"
    t.decimal "price", precision: 12, scale: 2
    t.decimal "cost_price", precision: 12, scale: 2
    t.decimal "original_price", precision: 12, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reference"
    t.integer "quantity"
    t.integer "tray_order_id"
    t.integer "tray_product_sold_id"
    t.integer "product_id"
  end

  create_table "tray_order_itens", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "tray_order_id"
    t.integer "tray_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tray_orders", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "tray_id"
    t.datetime "date"
    t.integer "tray_customer_id"
    t.decimal "partial_total", precision: 12, scale: 2
    t.string "point_sale"
    t.string "shipment"
    t.decimal "shipment_value", precision: 12, scale: 2
    t.datetime "shipment_date"
    t.decimal "payment_method_rate", precision: 12, scale: 2
    t.decimal "value_1", precision: 12, scale: 2
    t.string "payment_form"
    t.decimal "total", precision: 12, scale: 2
    t.string "shipment_integrator"
    t.datetime "modified"
    t.datetime "estimated_delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "discount", precision: 12, scale: 2
    t.integer "pedido_id"
    t.integer "customer_address_id"
    t.integer "installment"
  end

  create_table "tray_payments", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "tray_id"
    t.integer "tray_order_id"
    t.string "payment_method"
    t.decimal "value", precision: 12, scale: 2
    t.string "note"
    t.boolean "processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "error_message"
    t.boolean "notify"
  end

  create_table "turmapvs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "turma_id"
    t.integer "confirmado"
    t.integer "status_turma"
    t.integer "pendente_confir"
    t.integer "remanejado"
    t.integer "cancelado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "tipo_turma"
    t.date "data_inicio"
    t.date "data_fim"
    t.integer "novo_aluno"
    t.string "presence_list"
    t.integer "area_de_atuacao_id"
    t.index ["turma_id"], name: "index_turmapvs_on_turma_id"
  end

  create_table "turmas", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "codigo_turma"
    t.integer "funil_turma"
    t.string "tipo_turma"
    t.date "data_inicio"
    t.date "data_fim"
    t.date "data_inicio_modular"
    t.date "data_fim_modular"
    t.string "hora_inicio"
    t.string "hora_fim"
    t.integer "facilitador_id"
    t.integer "quantidade_minima"
    t.integer "quantidade_maxima"
    t.integer "produto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "meta"
    t.integer "ce_id"
    t.boolean "lancamento", default: true
    t.integer "tipo"
    t.integer "user_id"
    t.text "observacoes"
    t.integer "facilitador2_id"
    t.integer "parceiro"
    t.integer "hotel_id"
    t.decimal "setup", precision: 12, scale: 2
    t.decimal "valor_por_aluno", precision: 12, scale: 2
    t.integer "comissao", default: 0
    t.integer "responsavel_comercial_id"
    t.integer "tipo_turma_parceria"
    t.integer "area_de_atuacao_id"
    t.string "sankhya_id"
    t.integer "attendees_count"
    t.text "buzzlead_link"
    t.boolean "show_on_site", default: true
    t.integer "method"
    t.integer "moodle_course"
    t.string "files_url"
    t.integer "paid_communication_trail_id"
    t.integer "courtesy_communication_trail_id"
    t.integer "ged_deadline"
    t.integer "ged_concept_reduction_deadline"
    t.integer "ged_with_fee_deadline"
    t.integer "parent_id"
    t.integer "type_code"
    t.string "event_id"
  end

  create_table "turmas_angels", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "turma_id"
    t.integer "angel_id"
    t.index ["turma_id", "angel_id"], name: "index_turmas_angels_on_turma_id_and_angel_id"
  end

  create_table "turmas_staffs", id: false, charset: "latin1", force: :cascade do |t|
    t.integer "turma_id"
    t.integer "staff_id"
    t.index ["turma_id", "staff_id"], name: "index_turmas_staffs_on_turma_id_and_staff_id"
  end

  create_table "turmastaffs", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.integer "turma_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "turmapv_id"
    t.string "presence_list"
    t.text "email_aparte"
    t.boolean "enviarcc", default: true
  end

  create_table "unidades", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.integer "numero_filiacao"
    t.boolean "acts_like_matriz", default: false, null: false
    t.boolean "unidade_ativa", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "ativo_sispag", default: false
    t.boolean "holding", default: false
    t.integer "id_sankhya"
    t.integer "conta_id"
    t.string "cnpj"
    t.string "razao_social"
    t.string "nome_fantasia"
    t.boolean "standard_unity", default: false, null: false
    t.string "full_address"
  end

  create_table "user_roles", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "regra_id"
    t.boolean "ativo", default: true
    t.integer "coordenador_id"
    t.string "nome_bcal"
    t.integer "unidade_id"
    t.integer "colaborador_id"
    t.integer "equipe_id"
    t.string "avatar"
    t.string "ramal"
    t.integer "departamento_id"
    t.integer "id_sankhya"
    t.boolean "dev", default: false, null: false
    t.string "access_token"
    t.string "signature"
    t.integer "nectar_id"
    t.integer "sankhya_user_id"
    t.boolean "has_material", default: false
    t.index ["access_token"], name: "index_users_on_access_token", unique: true
    t.index ["equipe_id"], name: "index_users_on_equipe_id"
  end

  create_table "versions", id: :integer, charset: "utf8", collation: "utf8_unicode_ci", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "vicidial_call_data", id: :integer, charset: "latin1", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "length_in_seconds"
    t.string "location"
    t.integer "list_id"
    t.string "campaign_id"
    t.string "status"
    t.string "phone"
    t.string "comments"
    t.string "user_group"
    t.string "term_reason"
    t.integer "cliente_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id", "user_id"], name: "index_vicidial_call_data_on_cliente_id_and_user_id"
  end

  create_table "vicidial_leads", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "lead_id"
    t.boolean "success"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "cliente_id", null: false
    t.text "query_params"
    t.index ["cliente_id"], name: "index_vicidial_leads_on_cliente_id"
  end

  create_table "work_schedules", id: :integer, charset: "latin1", force: :cascade do |t|
    t.integer "colaborador_id"
    t.string "weekdays"
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["colaborador_id"], name: "index_work_schedules_on_colaborador_id"
  end

end
