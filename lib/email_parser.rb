require 'pry'
class EmailParser
  attr_accessor :email_string

  def initialize(email_string)
    @email_string = email_string

  end

  def parse
    empty_array = []
    if @email_string.split(",").length < 2
      return delim(@email_string)
    elsif @email_string.split(",").length == 2
      return csv(@email_string).uniq
    else
        @email_string.split(",").each do |string|

        if string.include?(" ")
          empty_array << delim(string)

        else
         empty_array << csv(string)

        end
      end
      empty_array.flatten
      end

end

    def delim(string)
      string.split(" ")
    end

    def csv(string)
      string.split(",").collect{|email| email.strip}
    end



end
