module SimpleTime
  require 'date'

  class << self

    # @return [Time]
    def new(*several_variants)
      Time.new(*several_variants)
    end

    def unix_timestamps
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