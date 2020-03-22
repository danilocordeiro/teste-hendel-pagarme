json.extract! recipient, :id, :bank_code, :agencia, :agendia_dv, :conta, :conta_dv, :legal_name, :document_number, :code, :transfer_enabled, :created_at, :updated_at
json.url recipient_url(recipient, format: :json)
