class ProducerBase < Rabbit
  def self.call(...)
    new(...).publish
  end

  def initialize(object)
    @object = object
  end

  def publish
    connection.start
    Rails.logger.info("Publishing message to topic #{topic_name}: #{parsed_message}")
    exchange(connection).publish(parsed_message)
    connection.close
  end

  def parsed_message
    @object.to_json
  end

  def topic_name
    raise NoMethodError
  end
end
