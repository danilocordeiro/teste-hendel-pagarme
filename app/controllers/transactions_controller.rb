class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    if defined?(current_member.information) && current_member.information != nil
      @transaction = Transaction.new
    else
      redirect_to new_information_path
    end
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.member = current_member

    ############################################################################
    if @transaction.pay_method == "credit_card" && @transaction.division == true
      transaction = PagarMe::Transaction.new(
        amount:    @transaction.amount,     
        card_hash: @transaction.card_hash,
        payment_method: @transaction.pay_method,
        :customer => {
        :name => "Danilo",
        :document_number => @transaction.member.information.document_number,
        :email => @transaction.member.email,
        split_rule: [
          @transaction.recipients.each do |recipient|
            { recipient_id: recipient.id, percentage: @transaction.split_rules.where(recipient_id: recipient.id).pluck(:percentage) }
          end
        ],
        :address => {
            :street => @transaction.member.information.street,
            :neighborhood => @transaction.member.information.neighborhood,
            :zipcode => @transaction.member.information.zipcode,
            :street_number => @transaction.member.information.street_number,
            :complementary => @transaction.member.information.complementary,
        },
        :phone => {
            :ddd => @transaction.member.information.ddd,
            :number => @transaction.member.information.phone_number
        }
        })
    #############################################################################
    elsif @transaction.pay_method == "credit_card" # realiza a transação via cartão
      transaction  = PagarMe::Transaction.new({
  amount: @transaction.amount,
  payment_method: "credit_card",
  card_hash: @transaction.card_hash,
  customer: {
    external_id: "#3311",
    name: "Morpheus Fishburne",
    type: "individual",
    country: "br",
    email: "mopheus@nabucodonozor.com",
    documents: [
      {
        type: "cpf",
        number: "30621143049"

      }

    ],
    phone_numbers: ["+5511999998888", "+5511888889999"],
    birthday: "1965-01-01"
  },
  billing: {
    name: "Trinity Moss",
    address: {
      country: "br",
      state: "sp",
      city: "Cotia",
      neighborhood: "Rio Cotia",
      street: "Rua Matrix",
      street_number: "9999",
      zipcode: "06714360"
    }
  },
  shipping: {
    name: "Neo Reeves",
    fee: 1000,
    delivery_date: "2000-12-21",
    expedited: true,
    address: {
      country: "br",
      state: "sp",
      city: "Cotia",
      neighborhood: "Rio Cotia",
      street: "Rua Matrix",
      street_number: "9999",
      zipcode: "06714360"
    }
  },
  items: [
    {
      id: "r123",
      title: "Red pill",
      unit_price: 10000,
      quantity: 1,
      tangible: true
    },
    {
      id: "b123",
      title: "Blue pill",
      unit_price: 10000,
      quantity: 1,
      tangible: true
    }

  ]
})
    end

    transaction.charge

    @transaction.status = transaction.status

    @transaction.id = transaction.id

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def recipients_for_select
      @recipients_for_select = Recipient.all 
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:amount, :pay_method, :card_hash, :division,  :split_rules_attributes => [:id, :percentage, :transaction_id, :recipient_id,
      :_destroy, :recipient_attributes => [:id, :legal_name]])
    end
end
