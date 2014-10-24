require 'minitest/autorun'

Dir.glob('./spec/unit/*_spec.rb') do |unit_test|
  load unit_test
end
