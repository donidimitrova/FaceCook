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

  def flash_class(level) #metodo aggiunto per cambiare gli alert
    case level.to_sym
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-danger"
    when :alert then "alert alert-danger"
    end
  end
end
