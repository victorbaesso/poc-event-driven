class BudgetApprovalConsumer < ConsumerBase
  def topic_name
    'budget.approval'
  end

  def process_message(message)
    budget = Budget.find_by(id: message[:budget][:id])
    return if budget.blank?

    budget.update(status: %w[approved rejected].sample)
    Rails.logger.info("Budget #{budget.id} processed with status: #{budget.status}")
  end
end
