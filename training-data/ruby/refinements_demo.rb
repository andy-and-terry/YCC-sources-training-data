module StringExtensions
  refine String do
    def shout
      upcase + '!'
    end
  end
end

using StringExtensions
puts 'hello'.shout
