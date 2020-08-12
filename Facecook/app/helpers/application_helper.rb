module ApplicationHelper
    def greet
        now = Time.now
        today = Date.today.to_time
      
        mattina = today.beginning_of_day
        pomeriggio = today.change( hour: 14 )
        sera = today.change( hour: 20 )
        tomorrow = today.tomorrow
      
        if (mattina..pomeriggio).cover? now
          'Buongiorno'
        elsif (pomeriggio..sera).cover? now
          'Buon pomeriggio'
        elsif (sera..tomorrow).cover? now
          'Buonasera'
        end
      end
end
