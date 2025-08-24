module ApplicationHelper
  def navbar_items
    [
      { name: 'Orçamentos', path: budgets_path },
      { name: 'Produtos', path: products_path },
      # { name: 'Vendas', path: sales_path },
    ]
  end
end
