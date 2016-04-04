web: bundle exec puma -C config/puma.rb -p $PORT
# sidekiq: bundle exec sidekiq -C config/sidekiq.yml

# make sure processes run in the foreground
# thin:         bundle exec thin start -p $PORT
# unicorn:        nohup bundle exec unicorn -c config/unicorn/unicorn.rb
# redis:          redis-server ./config/redis/development.conf
# solr:           bundle exec rake sunspot:solr:run
# redis_test:   redis-server ./config/redis/test.conf
# guard:        bundle exec guard
# elastic_dev:  elasticsearch -f -Des.config=./config/elasticsearch/development.yml
# elastic_test: elasticsearch -f -Des.config=./config/elasticsearch/test.yml
# resque:       bundle exec rake resque:work QUEUE=*
# sidekiq:      bundle exec sidekiq -C config/sidekiq.yml
# rabbitmq:     rabbitmq-server

# Optional but useful

# zeus:         zeus start
# spork:        bundle exec spork --port 9899
# spork_challenges:      cd engines/challenges && bundle exec spork --port 9901
# spork_groups_cucumber: cd engines/groups && bundle exec spork cucumber --port 9902
# spork_groups_rspec:    cd engines/groups && bundle exec spork rspec --port 9903
# evergreen:    bundle exec evergreen serve
# redis-commander --port 8081 --redis-host localhost --redis-port 9464
# memcache:     /usr/local/bin/memcached -l localhost
