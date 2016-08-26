require_relative 'account.rb'

module Bank
  class SavingsAccount < Account

    MIN_BALANCE = 10

    def initialize (id, amount, date)
      super
      # update fee
      @fee = 2
    end

    def add_interest(rate) # rate is a percentage, e.g. 0.25
      interest = @balance * (rate/100)
      # update @balance
      @balance += interest
      return interest
    end
  end
end
