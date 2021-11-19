class PaymentRecordsController < ApplicationController

  def index
    @payment_record = PaymentRecord.new
    @payment_records = PaymentRecord.page(params[:page]).per(10)
    @total_payment = @payment_records.inject(0) { |sum, payment_record| sum + payment_record.payment }


    # @budget = Budget.new
    @budget = PaymentRecord.last
    @bud = @budget.budget_id
    num = Budget.find_by(id: @bud)
    @number = num.budget_amount
    @budgets = Budget.all


  end

  def new
    @payment_record = PaymentRecord.new
    @payment_records = Category.all
  end

  def create
    # binding.pry
    @payment_record = PaymentRecord.new(payment_record_params)
    @payment_record.save
    # binding.pry
    #　render :new
    redirect_to payment_records_path
  end

  def show
    @payment_record = PaymentRecord.find(params[:id])
  end

  def edit
    @payment_record = PaymentRecord.find(params[:id])
  end

  def update
    @payment_record = PaymentRecord.find(params[:id])
    @payment_record.update(payment_record_params)
    redirect_to payment_records_path(@payment_record.id)
  end


private

  def payment_record_params
    params.require(:payment_record).permit(:category_id, :budgetary, :date, :payment, :payment_method, :memo, :voucher, :created_at, :updated_at, ).merge(budget_id: current_user.id)
  end

end
