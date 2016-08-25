require 'csv'
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

    end

    def self.all
      owners = []
      CSV.open('support/owners.csv', 'r').each do |line|
        owners << self.new(line[0], line[1], line[2], line[3], line[4], line[5])
      end
      return owners
    end

    def self.find(id)
      self.all.each do |item|
        puts "foo"
        if item.id == id
          return item
        end
      end
      puts "No such owner found."
    end

    def display_info
      puts "Account holder: #{@first_name} #{@last_name}"
      puts "Address: #{@street}, #{@city}, #{@state}"
    end

  end
end
