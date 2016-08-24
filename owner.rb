module Bank
  class Owner
    attr_reader :id, :last_name, :first_name, :street, :city, :state

    def initialize (id, last_name, first_name, street_address, city, state)
      @id = id
      @last_name = last_name
      @first_name = first_name
      @street = street_address
      @city = city
      @state = state
      # puts "Enter the account holder's name:"
      # @name = gets.chomp
      # puts "Street address:"
      # @street = gets.chomp
      # puts "City:"
      # @city = gets.chomp
      # puts "State:"
      # @state = gets.chomp
    end

    def self.all
      owners = []
      CSV.open('support/account_owners.csv', 'r').each do |line|
        owners << self.new(line[0], line[1], line[2], line[3], line[4], line[5])
      end
      return owners
    end


    def display_info
      puts "Account holder: #{@first_name} #{@last_name}"
      puts "Address: #{@street}, #{@city}, #{@state}"
    end

  end
end
