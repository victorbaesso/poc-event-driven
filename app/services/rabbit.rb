class Rabbit
  def connection
    @connection ||= Bunny.new(hostname: 'rabbit_mq')
  end

  def channel(connection)
    @channel ||= connection.create_channel
  end

  def exchange(connection)
    channel(connection)
    @exchange ||= @channel.fanout(topic_name)
  end
end
