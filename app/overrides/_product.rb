Deface::Override.new(
  virtual_path: 'spree/admin/shared/sub_menu/_product',
  name: 'Add videos sub menu',
  insert_bottom: '[data-hook="admin_product_sub_tabs"]',
  text: <<-HTML
        <%= tab :videos, match_path: '/videos' %>
    HTML
    )
