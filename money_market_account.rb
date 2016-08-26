require_relative 'account.rb'
require_relative 'savings_account.rb'

module Bank
  class MoneyMarketAccount < SavingsAccount
    MIN_BALANCE = 10000
    OVERDRAFT_FEE = 100

    attr_reader :transactions

    def initialize(id, balance, date)
      super
      @fee = 0
      @transactions = 6
      @overdraft_warning = false

    end

    def withdraw (amount)

      if exceeds_transactions?
        return @balance
      end

      if @overdraft_warning
        puts "You must raise the account balance to at least
        $#{(self.class::MIN_BALANCE) +1} to get any more transactions."
        return @balance
      end

      # Adjust transactions
      @transactions -= 1

      # Check if this would bring things below minimum balance
      if (@balance - amount) < self.class::MIN_BALANCE
        @balance -= (amount + OVERDRAFT_FEE)
        @overdraft_warning = true
      else
        @balance -= amount
      end

      return @balance
    end

    def deposit(amount)

      if exceeds_transactions?
        return @balance
      end

      if @overdraft_warning
        if (@balance + amount) < self.class::MIN_BALANCE
          puts "You must raise the account balance to at least
          $#{self.class::MIN_BALANCE} to get any more transactions."
          return @balance
        else
          @overdraft_warning = false
        end
      end

      super
      @transactions -= 1
      return @balance
    end

    def exceeds_transactions?
      if (@transactions == 0)
        puts "You cannot perform any more transactions this month."
        return true
      else
        return false
      end
    end




    def reset_transactions
      @transactions = 6
    end

  end
end
