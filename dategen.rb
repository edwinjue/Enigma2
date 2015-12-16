class Dategen
	attr_reader :key
	def initialize(input)
    @key = validate_date(input)
	end

	def validate_date(date)

    #check if date is a time, date or datetime object
    if (date.is_a?Time) || (date.is_a?Date) || (date.is_a?DateTime)
      if date.respond_to?'strftime'
        return date.strftime('%d%m%y')
      else
        #invalid object type
        raise ArgumentError, "date: '#{date}' is an invalid date. Try: a date/time/datetime object or string in the form 'ddmmyy'"
      end
    #check if date is a valid date string
    elsif (date.is_a?String)
      if date.to_i > 0 && date.length == 6
        return date
      else
        #invalid string format
        raise ArgumentError, "date: '#{date}' is an invalid date. Try: a date/time/datetime object or string in the form 'ddmmyy'"
      end
    #return current date
    else
      Time.now.strftime('%d%m%y')
    end

  end
end
