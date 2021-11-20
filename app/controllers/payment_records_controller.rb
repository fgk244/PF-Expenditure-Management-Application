class PaymentRecordsController < ApplicationController

  def search
    @search_params = payment_record_search_params  #検索結果の画面で、フォームに検索した値を表示するために、paramsの値をビューで使えるようにする
    @payment_records = PaymentRecord.search(payment_record_search_params)  #Payment_recordモデルのsearchを呼び出し、引数としてparamsを渡している。

    #@total_payment = @serches.inject(0) { |sum, payment_record| sum + payment_record.payment }
  end

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
    current_user.payment_records.create!(payment_record_params)
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

  def payment_record_search_params
    params.fetch(:search, {}).permit(:from_date, :to_date, :category, :payment_method, :memo, :payment)
  end


end
