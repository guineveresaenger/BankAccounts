require_relative 'account.rb'

module Bank
  class SavingsAccount < Account

    MIN_BALANCE = 1000

    def initialize (id, amount, date)
      super
      # update fee
      @fee = 200
    end

    # override withdrawal method... actually updating the parent class is easier!
    # def withdraw(money)
    #   # call to super gives us a balance. Subtract an additional 200 pennies
    #
    #   if (@balance - (money+ @fee)) < @minimum_balance
    #     puts "You don't have enough funds. Sorry man."
    #   else
    #     @balance -= (money + @fee)
    #   end
    #   return @balance
    # end

    def add_interest(rate) # rate is a percentage, e.g. 0.25
      interest = @balance * (rate/100)
      # update @balance
      @balance += interest
      return interest
    end
  end
end

# # let's test this!
#
# my_save = Bank::SavingsAccount.new(13, 900, "now")
#
# puts my_save.balance
# puts my_save.id
# puts my_save.date
# puts Bank::SavingsAccount::MIN_BALANCE
# puts "Withdrawing 1000 pennies(ten dollars): #{my_save.withdraw(1000)}"
# puts my_save.balance
# puts "Trying to withdraw 9000 pennies ($90) #{my_save.withdraw(9000)}"
# puts "Interest earned: #{my_save.add_interest(0.25)}"
# puts "Updated balance: #{my_save.balance}"
