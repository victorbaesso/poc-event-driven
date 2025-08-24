class ConsumerBase < Rabbit

  def consume
    connection.start

    queue.subscribe(block: true) do |_delivery_info, _properties, payload|
      message = parse_message(payload)
      Rails.logger.info("Received message from topic #{topic_name}: #{message}")
      process_message(message)
    end
  end

  def queue
    @queue ||= channel(connection).queue('').bind(exchange(connection))
  end

  def parse_message(message)
    JSON.parse(message).deep_symbolize_keys
  end

  def topic_name
    raise NoMethodError
  end

  def process_message(message)
    raise NoMethodError
  end
end
