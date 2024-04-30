class AccountBalancesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user_and_account_balance

  def show
    # No additional logic needed here, as the @account_balance instance variable is set in the before_action
  end

  private

  def set_user_and_account_balance
    @user = current_user
    @account_balance = @user.account_balance
  end
end
