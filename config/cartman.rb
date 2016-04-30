REDIS_CONF = YAML::load_file(Rails.root.join('config', 'redis.yml'))
Cartman.config do |c|
  c.cart_expires_in = 86400  #one day, in second
  c.unit_cost_field = :unit_cost
  c.quantity_field = :quantity
  c.redis = Redis.new(:host => REDIS_CONF['host'], :port => REDIS_CONF['port'], :db => 15)
end
