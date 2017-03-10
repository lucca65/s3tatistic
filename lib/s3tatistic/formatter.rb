require 'tty-table'
require 'humanize-bytes'

class S3tatistic::Formatter
  class << self
    def format_buckets(buckets, options)
      first, = buckets
      headers = first.keys
      rows = buckets
               .map(&:values)
               .map { |b| format_size(b, options.block) }

      table = TTY::Table.new(headers, rows)
      table.render(:basic)
    end

    def format_bucket_info(bucket)
    end

    def format_size(values, format)
      formatted = Humanize::Byte.new(values[3]).public_send("to_#{format}")
      values[3] = "#{formatted} #{format}b"
      values
    end
  end
end
