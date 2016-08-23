 require_relative 'owner.rb'
module Bank
  class Account
    attr_reader :balance
    attr_reader :owner
    attr_reader :id


    def initialize(id, balance)
      @id = id
      @owner = Bank::Owner.new

      if balance > 0
        @balance = balance
      else
        raise ArgumentError.new("You must have a positive initial balance
        to open an account.")
      end
    end

    def withdraw(money)
      if (@balance - money) >= 0
        @balance -= money
      else
        puts "Insufficient funds. Account may not be overdrawn. Transaction
        canceled."
      end
      return @balance
    end

    def deposit(money)
      @balance += money
      return @balance
    end


  end
end

## make some test code
# 
# my_acc = Bank::Account.new(13, 400)
# puts "Your account ID\#: #{my_acc.id}"
# puts "Balance: $#{my_acc.balance}"
# my_acc.owner.display_info
# my_acc.withdraw(400)
# puts my_acc.balance
# my_acc.withdraw(1)
# puts my_acc.balance
# my_acc.deposit(200)
# puts my_acc.balance
# another_acc = Bank::Account.new(14, -200)
# puts another_acc.balance
