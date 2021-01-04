module SimpleDateTime

  require 'date'

  class << self

    # base now date return
    # @return [String]
    def now_date_s
      DateTime.now.to_s
    end

    # now date time
    # @param [format] - empty will be format as %Y-%m-%d %H:%M:%S
    # @return [String]
    def now_date_time_s(format: "")
      if format == ""
        format = "%Y-%m-%d %H:%M:%S"
      end
      DateTime.now.strftime(format)
    end

    # @param [string] date_str
    # @param [String] format
    # @return [DateTime]
    def strptime(date_str, format: "")
      if date_str == ""
        raise ArgumentError, "date_str is empty"
      end
      if format == ""
        format = '%Y-%m-%d %H:%M:%S %z'
      end
      DateTime.strptime(date_str, format)
    end

    # @param [string] date_str
    # @return [DateTime]
    def parse(date_str)
      if date_str == ""
        raise ArgumentError, "date_str is empty"
      end
      DateTime.parse(date_str)
    end
  end
end