# encoding: utf-8
require 'twitter'

Twitter.configure do |config|
  config.consumer_key = ENV['EVERYUNICODE_CONSUMER_KEY']
  config.consumer_secret = ENV['EVERYUNICODE_CONSUMER_SECRET']
  config.oauth_token = ENV['EVERYUNICODE_OAUTH_TOKEN']
  config.oauth_token_secret = ENV['EVERYUNICODE_OAUTH_TOKEN_SECRET']
end

File.open('everyunicode.txt', 'r+:UTF-8') do |file|
  # read file in as an array
  every = file.read.split("\t")

  # tweet next character and remove it from array
  char = every.shift
  # add zero width space character to characters that twitter will silently ignore
  Twitter.update(char + ( char =~ /(S|D|F|M|W)/ ? "\u200b" : "") )

  # erase file
  file.seek 0, IO::SEEK_SET 
  file.truncate 0

  # write array back to file
  file.write every.join("\t")
end
