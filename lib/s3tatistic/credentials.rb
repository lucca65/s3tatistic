require 'netrc'

# Responsible for checking for credentials
class S3tatistic::Credentials
  class << self
    def read
      Netrc.read["s3tatistic"]
    end

    def config_exists?
      !read.nil?
    end

    def write(key, secret)
      n = Netrc.read
      n["s3tatistic"] = key, secret
      n.save
    end
  end
end

# [default]
# aws_access_key_id = #{}
# aws_secret_access_key = #{}
