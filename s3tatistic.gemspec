Gem::Specification.new do |s|
  s.name        = 's3tatistic'
  s.version     = '0.1.1'
  s.summary     = "Show statistics for your S3 buckets!"
  s.executables << 's3tatistic'
  s.files       = ['lib/s3tatistic.rb', 'lib/s3tatistic/amazon_s3.rb',
                  'lib/s3tatistic/formatter.rb']
  s.authors     = ["Julien Lucca"]
  s.email       = 'julienlucca@gmail.com'
  s.license     = 'MIT'
end
