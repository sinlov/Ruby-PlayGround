module SimpleTime
  require 'date'

  class << self

    def unix_timestamp
      Time.now.to_i
    end

    def time_format_s(format: "")
      if format == ""
        format = "%Y-%m-%d %H:%M:%S"
      end
      Time.now.strftime(format)
    end
  end
end