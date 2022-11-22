class Card
    def initialize(value)
        @value = value
        @face_down = true
    end 

    def value()
        if @face_down
            return " "
        else
            @value
        end
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

    def to_s
        return value
    end
end