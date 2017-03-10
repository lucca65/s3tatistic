require 'tty-table'

class S3tatistic::Formatter
  class << self
    def format_buckets(buckets)
      first, = buckets
      headers = first.keys
      rows = buckets.map(&:values)

      table = TTY::Table.new(headers, rows)
      puts table.render(:basic)
    end

    def format_bucket_info(bucket)
    end
  end
end
