require_relative 'account.rb'

module Bank
  class CheckingAccount < Account
    def initialize(id, amount, date)
      super
      # update fee to 100
      @fee = 100
      #add a counter for the checks
      @checks = 0
    end

    def withdraw_using_check(amount)

      attempted_balance = @balance - amount
      if @checks >=3
        attempted_balance -= @fee
      end
      #check if we're below minimum_balance
      if attempted_balance >= minimum_balance
        @balance = attempted_balance
      end
      return @balance
    end


    def reset_checks
      @checks = 0
    end
  end
end
