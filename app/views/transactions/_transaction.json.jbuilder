json.extract! transaction, :id, :amount, :pay_method, :card_hash, :division, :status, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
