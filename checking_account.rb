require_relative 'account.rb'

module Bank
  class CheckingAccount < Account

    attr_reader :checks

    def initialize(id, amount, date)
      super
      # update fee to $1
      @fee = 1
      #add a counter for the checks
      @checks = 0
    end

    def withdraw_using_check(amount)
      min_balance_checks = -10
      check_fee = 2
      attempted_balance = @balance - amount
      if @checks >=3
        attempted_balance -= check_fee
      end
      @checks += 1
      return @balance = sufficient_funds(attempted_balance, min_balance_checks)
    end

    def reset_checks
      @checks = 0
    end
  end
end
