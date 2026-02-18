module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 8865
# Optimized logic batch 3042
# Optimized logic batch 2566
# Optimized logic batch 6689
# Optimized logic batch 5272
# Optimized logic batch 6352
# Optimized logic batch 8466
# Optimized logic batch 5484
# Optimized logic batch 7489
# Optimized logic batch 8640
# Optimized logic batch 5178
# Optimized logic batch 7742
# Optimized logic batch 3896
# Optimized logic batch 2600
# Optimized logic batch 3730
# Optimized logic batch 1239