class PhoneBook
    def initialize
        @entries = []
    end

    def add(name, number, is_listed)
        # Validate phone number format NNN-NNN-NNNN (no 0s for first block)
    return false unless number.match?(/^[1-9]\d{2}-\d{3}-\d{4}$/)
        #check if name already exists
    return false if @entries.any? { |e| e[:name] == name }
        #checks if number is already listed, no dupes 
    if @entries.any? { |e| e[:number] == number && e[:listed]}
        return false if is_listed
    end 

    #adds if all checks pass
     @entries << {name: name, number: number, listed: is_listed }
     true 
    end

    def lookup(name)
        entry =  @entries.find { |e| e[:name] == name && e[:listed] }
        entry ? entry[:number] : nil 
    end

    def lookupByNum(number)
        entry = @entries.find {|e| e[:number] == number && e[:listed]}
        entry ? entry[:name] : nil 

    end

    def namesByAc(areacode)
        @entries
            .select { |e| e[:number].start_with?(areacode) }
            .map { |e| e[:name]}
    end
end
