class BudgetsController < ApplicationController

before_action :authenticate_user!

  def index
    @newbudget = Budget.new
  end

  def new
    @newbudget = Budget.new
  end

  def edit
    @budget = Budget.find(params[:id])
  end

  def update
    @budget = Budget.find(params[:id])
    @budget.update(budget_params)
    redirect_to edit_budget_path(@budget)
  end

  def create
    @budget = Budget.new(budget_params)
    @budget.user_id = current_user.id
    @budget.save
    redirect_to payment_records_path
  end

 private

  def budget_params
    params.require(:budget).permit(:budget_amount)
  end

end
