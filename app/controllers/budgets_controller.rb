class BudgetsController < ApplicationController

def index
  @newbudget = Budget.new
end

def edit
  @budget = Budget.find(params[:id])
  # binding.pry
end

def update
    @budget = Budget.find(params[:id])
    @budget.update(budget_params)
    redirect_to edit_budget_path(@budget)
end


def create
  @budget = Budget.new(budget_params)
  @budget.save
  redirect_to budgets_path
end

 private

  def budget_params
    params.require(:budget).permit(:budget_amount)
  end

end
