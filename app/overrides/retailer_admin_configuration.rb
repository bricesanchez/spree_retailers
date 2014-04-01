Deface::Override.new(:virtual_path  => "spree/admin/shared/_configuration_menu",
                     :name          => "add_retailer_types_to_admin_configurations_menu",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     :text          => "<%= configurations_sidebar_menu_item t('spree.admin.settings.retailer_types'), admin_retailer_types_path %>",
                     :disabled      => false)
