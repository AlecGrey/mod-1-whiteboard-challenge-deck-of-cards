require 'pry'

class Deck
    attr_accessor :cards

    def initialize
        suits = ["Hearts", "Clubs", "Diamonds", "Spades"]
        rank = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        @cards = []

        suits.each do |suit|
            rank.each do |rank|
                @cards << Card.new(suit, rank)
            end
        end
    end

    def choose_card
        self.cards.delete_at(rand(52))
    end

    def shuffle
        3.times do
            shuffled_deck = Array.new(51)
            split_1 = self.cards[0..25]
            split_2 = self.cards[26..51]

            binding.pry
            self.cards = shuffled_deck.map do |card|
                if split_1.length > 1 && split_2.length > 1
                    case rand(2)
                    when 0
                        split_1.shift
                    when 1
                        split_2.shift
                    end
                elsif split_1.length > 1
                    split_1.shift
                else
                    split_2.shift
                end
            end
        end
    end
end

class Card
    attr_accessor :suit, :rank

    def initialize(suit, rank)
        @rank, @suit = rank, suit
    end

end

Pry.start

