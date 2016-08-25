require_relative 'owner.rb'
require 'csv'
module Bank
  class Account
    attr_reader :balance, :owner, :id, :date, :minimum_balance

    def initialize(id, balance, open_date)
      @id = id
      @owner = nil
      @date = open_date
      @minimum_balance = 0

      if balance > @minimum_balance
        @balance = balance
      else
        raise ArgumentError.new("You must have a positive initial balance
        to open an account.")
      end
    end

    def self.all
      accounts = []
      CSV.open('support/accounts.csv', 'r').each do |line|
        # For clarity, let's pull out the data and assign it
        # to variables.
        id = line[0].to_i
        balance = line[1].to_i
        open_date = line[2]
        accounts << self.new(id, balance, open_date)
      end
      return accounts
    end

    def self.find(id)
      self.all.each do |account|
        # IF account's id matches id, return that account and end
        if account.id == id
          return account
        end
      end

      # the loop has come up with nothing and returned nothing
      puts "This account doesn't exist."
    end

    # def self.link_account_to_owner
    #
    #   self.all.each do |account|
    #     CSV.open('support/account_owners.csv', 'r').each do |item|
    #       if account.id == item[0]
    #         self.owner = Owner.find(item[1]) ### make owner.new with item args?
    #
    #       end
    #     end
    #   #
    #
    #   end
    #   # return owners
    # end

    def user_create_owner
      puts "Create an owner ID (different from your account ID):"
      id = gets.chomp
      puts "Enter the account holder's last name:"
      last_name = gets.chomp
      puts "Enter the account holder's first name:"
      first_name = gets.chomp
      puts "Street address:"
      street = gets.chomp
      puts "City:"
      city = gets.chomp
      puts "State:"
      state = gets.chomp

      @owner = Owner.new(id, last_name, first_name, street, city, state)
      return @owner
    end

    def withdraw(money)
      if (@balance - money) >= @minimum_balance
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
