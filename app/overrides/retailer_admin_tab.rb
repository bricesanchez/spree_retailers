Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
                     :name => "admin_retailers_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<% if can? :admin, Spree::Admin::RetailersController %>
                                 <%= tab :retailers,  :url => spree.admin_retailers_path, :icon => 'globe' -%>
                               <% end %>",
                     :disabled => false)

Deface::Override.new(:virtual_path  => "spree/layouts/admin",
                     :name          => "add_retailers_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text          => "<%= tab(:retailers, :retailer_types, :local_stockists) %>",
                     :disabled      => false,
                     :original      => '031652cf5a054796022506622082ab6d2693699f')