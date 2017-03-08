require 'aws-sdk'

class S3tatistic::AmazonS3
  def initialize
    @s3 = Aws::S3::Resource.new
  end

  def buckets
    @s3.buckets.map(&:name)
  end
end
