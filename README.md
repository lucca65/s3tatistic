# s3tatistic
Show statistics for your S3 buckets 🗑📈

## Installing

```shell
$ gem install s3tatistic
$ s3tatistic buckets
```
## Usage

### Avaliable commands

You can list all your buckets with `s3tatistic buckets`, info for a single bucket with `s3tatistic info BUCKET_NAME`

### Options

### Getting help

```shell
$ s3tatistic help # Help for whole program
$ s3tatistic buckets --help # Help for a single command
```

## Contribuiting

### Clone the repo

Do *the drill*:

```shell
$ git clone https://github.com/lucca65/s3tatistic.git
$ cd s3tatistic
```

### Running on `irb`

You can easily run it inside an `irb` session for you delight:

```ruby
$ irb -Ilib -rs3tatistic
2.3.1 :001 > S3tatistic::AmazonS3.buckets
  => []
```

### Installing it as a local gem

```shell
$ gem build s3tatistic.gemspec
$ gem install s3tatistic-0.1.0.gem
```
