module Bank
  class Owner
    #attr_reader :name, :street, :city, :state, :zipcode

    def initialize
      puts "Enter the account holder's name:"
      @name = gets.chomp
      puts "Street address:"
      @street = gets.chomp
      puts "City:"
      @city = gets.chomp
      puts "State:"
      @state = gets.chomp
      puts "Zipcode"
      @zipcode = gets.chomp
    end

    def display_info
      puts "Account holder: #{@name}"
      puts "Address: #{@street}, #{@city}, #{@state}, #{@zipcode}"
    end

  end
end
