Deface::Override.new( virtual_path: 'spree/admin/shared/_product_sub_menu', 
                      name: 'wizard_add_product_sub_menu',
                      insert_bottom: 'ul#sub_nav', 
                      text: "<%= tab :wizards %>", 
                      :original => 'b24abd0565e131de2a3bd125db83e7f3d2b3db9d'
                    )