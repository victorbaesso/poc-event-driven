class BudgetApprovalProducer < ProducerBase
  def topic_name
    'budget.approval'
  end

  def parsed_message
    {
      budget: {
        **@object.slice(:id, :value, :deadline),
        items: @object.items.map { _1.slice(:value, :quantity) }
      }
    }.to_json
  end
end
