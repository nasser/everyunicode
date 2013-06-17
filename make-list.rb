# encoding: utf-8
require 'unicode_utils'

File.open('everyunicode.txt', 'w') do |file|
  UnicodeUtils::Codepoint::RANGE.each do |i|
    file.write("#{UnicodeUtils::Codepoint.new(i).to_s}\t") if UnicodeUtils.code_point_type(i) == :Graphic
  end
end