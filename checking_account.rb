require_relative 'account.rb'


module Bank
  class CheckingAccount < Account

    attr_reader :checks

    def initialize(id, amount, date)
      super
      # update fee to 100
      @fee = 100
      #add a counter for the checks
      @checks = 0
    end

    def withdraw_using_check(amount)
      # Checks have a special overdraft option
      min_balance_checks = -1000
      # And a special check fee
      check_fee = 200
      attempted_balance = @balance - amount
      if @checks >=3
        attempted_balance -= check_fee
      end
      #check if we're below special minimum_balance
      if attempted_balance >= min_balance_checks
        @balance = attempted_balance
        # update checks
        @checks += 1
      else
        puts "Sorry, you can't go below 1000 pennies."
      end
      return @balance
    end


    def reset_checks
      @checks = 0
    end
  end
end

## testing
#
# my_check = Bank::CheckingAccount.new(13, 5000, "today")
# puts my_check.id
# puts my_check.balance
# puts my_check.date
# puts my_check.withdraw(900)
# puts my_check.deposit(1000)
# puts
# puts "Minimum Balance: #{Bank::CheckingAccount::MIN_BALANCE}"
# puts my_check.checks
# puts my_check.withdraw_using_check(300)
# puts my_check.checks
# puts my_check.withdraw_using_check(300)
# puts my_check.checks
# puts my_check.withdraw_using_check(300)
# puts my_check.checks
# puts "The fourth check..."
# puts my_check.withdraw_using_check(300)
# puts my_check.balance
# puts my_check.checks
# puts "And the fifth"
# puts my_check.withdraw_using_check(300)
# puts my_check.balance
# puts my_check.checks
# my_check.reset_checks
# puts my_check.checks
# puts my_check.withdraw_using_check(300)
