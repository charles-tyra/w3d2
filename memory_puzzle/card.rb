class Card
    attr_reader :value
    def initialize(value)
        @value = value
        @face_down = true
    end 

    def hide()
        @face_down = true
    end

    def reveal()
        @face_down = false
    end

    def ==(other_card)
        self.value == other_card.value
    end

    def valPrint()
        if !@face_down
            print(@value)
        end
    end
    
    def to_s
        return "Value: #{@value} face_down: #{@face_down}"
    end
end