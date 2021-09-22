Deface::Override.new(
  virtual_path:  'spree/admin/shared/_main_menu',
  name:          'videos_main_menu_tabs',
  insert_bottom: 'nav',
  text: <<-HTML
        <% if can? :admin, Spree::Video %>
          <ul class="nav nav-sidebar border-bottom" id="sidebarVideo">
            <%= main_menu_tree "Videos", icon: "videos.svg", sub_menu: "video", url: "#sidebar-video" %>
          </ul>
        <% end %>
HTML
)