module SimpleDate
  require 'date'

  class << self

    # base now date return
    # @return [String]
    def now_date
      return Time.now.to_s
    end

    # format as %Y-%m-%d %H:%M:%S
    # @return [String]
    def now_date_time
      return Time.now.strftime("%Y-%m-%d %H:%M:%S")
    end
  end

end