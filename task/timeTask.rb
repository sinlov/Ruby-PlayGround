=begin
  file timeTask.rb
  create "sinlov" on 16/11/25.
  this program under the term of Ruby's License
  (http://www.ruby-lang.org/LINCENSE.txt)
=end


# gem install 'rufus-scheduler'

require 'rufus/scheduler'
scheduler = Rufus::Scheduler.new
puts Time.new
puts 'start task time'
scheduler.in '1s' do
  puts Time.new
  puts 'Time task running'
end

scheduler.every("2s") do
  puts Time.now
end

# class MyTmeTask
#
# end
