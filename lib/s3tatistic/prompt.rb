# coding: utf-8
require 'tty'
require_relative 'credentials'
require_relative 's3'

prompt = TTY::Prompt.new

puts 'Welcome to s3tatistic'

# check if user already has credentials
unless Credentials.config_exists?
  puts 'S3tatistic needs your S3 credentials'
  access_key = prompt.ask('Please fill you Access Key: ')
  secret = prompt.ask('Please fill you Secret Access Key: ')

  Credentials.write(access_key, secret)
end

puts 'yay everything is alright'

access_key, secret = Credentials.read
s3 = AmazonS3.new(access_key, secret)

puts s3.all_buckets

# run program if yes

# ● Bucket name
# ● Creation date (of the bucket)
# ● Number of files
# ● Total size of files
# ● Last modified date (most recent file of a bucket)
