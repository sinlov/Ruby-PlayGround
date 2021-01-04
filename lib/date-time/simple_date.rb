module SimpleDate
  require 'date'

  class << self

    # @return [Date]
    def new(*arg)
      Date.new(*arg)
    end

    # base now date return
    # @return [String]
    def now_date_s
      Date.today.to_s
    end

    # now date time
    # @param [format] - empty will be format as %Y-%m-%d %H:%M:%S
    # @return [String]
    def now_date_time_s(format: "")
      if format == ""
        format = "%Y-%m-%d %H:%M:%S"
      end
      Date.today.strftime(format)
    end

    # @param [string] date_str
    # @return [Date] date
    def parse(date_str)
      if date_str == ""
        raise ArgumentError, "date_str is empty"
      end
      return Date.parse(date_str)
    end

  end

end