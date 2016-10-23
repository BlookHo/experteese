# README


Caching

To switch caching in production (on Heroku) - it is necessary to upload Heroku add-on:

Install the MemCachier add-on and configure caching

But - it is payable on Heroku!
So - all lines, concern to caching in Experteese - are commented.
To display caching in development env. - uncomment these lines:

## gemfile
 gem 'dalli'
 gem 'memcached' # before - check to be installed: $ sudo apt-get install libsasl2-dev


## development.rb
  comment:  config.cache_store = :dalli_store
  uncomment:  config.cache_store = :memory_store

## comment all div -#%h1 Cache Stats
 