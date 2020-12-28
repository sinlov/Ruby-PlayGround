module SimpleDate
  require 'date'

  class << self

    # base now date return
    # @return [String]
    def now_date
      Time.now.to_s
    end

    # now date time
    # @param [format] - empty will be format as %Y-%m-%d %H:%M:%S
    # @return [String]
    def now_date_time(format: "")
      if format == ""
        format = "%Y-%m-%d %H:%M:%S"
      end
      Time.now.strftime(format)
    end
  end

end