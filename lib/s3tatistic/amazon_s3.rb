require 'aws-sdk'

class S3tatistic::AmazonS3
  class << self
    def ss3 # static s3
      @@s3 ||= Aws::S3::Resource.new
    end

    def buckets
      ss3.buckets.map {|b| bucket_info(b) rescue next}.select{|b| !b.nil?}
    end

    def info(bucket_name)
      bucket = find_bucket(bucket_name)
      objects = eager_objects(bucket) # AWS don't yield it correctly, so we get eager
      {
        name: bucket.name,
        created_at: bucket.creation_date,
        files_count: objects.count,
        files_size: files_size(objects),
        last_modified: last_modified(objects)
      }
    end

    def find_bucket(name)
      ss3.bucket(name)
    end

    def eager_objects(bucket)
      eager_load = []
      bucket.objects.each { |o| eager_load << o }
      eager_load
    end

    def files_size(objects)
      objects.map(&:size).reduce(&:+) # yay, functional ruby
    end

    def last_modified(objects)
      objects.sort_by(&:last_modified).reverse.first
    end
  end
end
