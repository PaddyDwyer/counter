module Counter
  class Subscriber
    def initialize(decks: 8)
      @decks = decks
      @cards_played = 0
      @count = 0
      @jacks = 0
    end
    def cards_remaining
      (52 * @decks) - @cards_played
    end
    def decks_remaining
      (cards_remaining / 52.0).round
    end
    def true_count
      (@count / decks_remaining).floor.to_s.rjust(3, " ")
    end
    def disp_count
      @count.to_s.rjust(3, " ")
    end
    def keypress(event)
      case event.value
      when 'a'
        @count += 1
        @cards_played += 1
      when 's'
        @cards_played += 1
      when 'd'
        @count -= 1
        @cards_played += 1
      when "w"
        @jacks += 1
      end
      print "Count: #{disp_count}     True Count: #{true_count}      Decks Left: #{decks_remaining.to_s.rjust(2, " ")}  CL: #{cards_remaining}\r"
      $stdout.flush
    end
  end
end
