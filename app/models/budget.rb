class Budget < ApplicationRecord
  enum :status, {
    draft: 'draft', submitted: 'submitted', approved: 'approved', rejected: 'rejected'
  }, default: :draft

  validates :status, presence: true

  after_save :sent_to_approval, if: :submitted?

  has_many :items, class_name: 'BudgetProduct', dependent: :destroy
  accepts_nested_attributes_for :items, allow_destroy: true

  def humanized_status
    {
      draft: 'Rascunho',
      submitted: 'Submetido',
      approved: 'Aprovado',
      rejected: 'Rejeitado'
    }[status.to_sym]
  end

  private

  def sent_to_approval
    BudgetApprovalProducer.call(self)
  end
end
