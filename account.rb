require_relative 'owner.rb'
require 'csv'
module Bank
  class Account

    MIN_BALANCE = 0
    attr_reader :balance, :owner, :id, :date

    def initialize(id, balance, open_date)
      @id = id
      @owner = nil
      @date = open_date
      @fee = 0

      if balance > self.class::MIN_BALANCE
        @balance = balance
      else
        raise ArgumentError.new("You must have an initial balance of more than
        $#{self.class::MIN_BALANCE} to open this account.")
      end
    end

    def withdraw(amount)
      attempted_balance = @balance - (amount + @fee)

      return @balance = sufficient_funds(attempted_balance, self.class::MIN_BALANCE)
    end

    # def withdraw(money)
    #   if (@balance - money) >= @minimum_balance
    #     @balance -= money
    #   else
    #     puts "Insufficient funds. Account may not be overdrawn. Transaction
    #     canceled."
    #   end
    #   return @balance
    # end

    def deposit(money)
      @balance += money
      return @balance
    end

    # how do I make this private again?
    def sufficient_funds (attempt, limit)
      if attempt >= limit
        return attempt
      else
        puts "Insufficient funds. Account may not be drawn below
        $#{limit}. Transaction canceled."
        return @balance
      end
    end

    def self.all
      accounts = []
      CSV.open('support/accounts.csv', 'r').each do |line|
        # the first entry in the csv file is account id, the second is
        # balance, the third opening date.
        # Since balance is in pennies, we'll handle that right here.
        accounts << self.new(line[0].to_i, line[1].to_f/100, line[2])
      end
      return accounts
    end

    def self.find(id)
      self.all.each do |account|

        if account.id == id
          return account
        end
      end
      # if loop doesn't return
      puts "This account doesn't exist."
    end

    ## I never got this to work!
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
  end
end
