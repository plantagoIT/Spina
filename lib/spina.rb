require 'spina/engine'
require 'spina/railtie'
require 'spina/plugin'
require 'spina/theme'
require 'spina/attr_json_spina_parts_model'

module Spina

  include ActiveSupport::Configurable

  PARTS = []
  PLUGINS = []
  THEMES = []

  config_accessor :backend_path, :disable_frontend_routes, :storage, :max_page_depth, :locales, :embedded_image_size, :allow_creating_pages, :allow_ordering_pages, :show_social_media, :show_analytics

  self.backend_path = 'admin'

  self.disable_frontend_routes = false

  self.storage = :file

  self.max_page_depth = 5

  self.locales = [I18n.default_locale]

  # Images that are embedded in the Trix editor are resized to fit
  # You can optimize this for your website and go for a smaller (or larger) size
  # Default: 2000x2000px
  self.embedded_image_size = "2000x2000>"

  # Plantago config stuff

  # This allows the user to add new pages to the project
  self.allow_creating_pages = false

  # This allows the user to order the navigation menu
  self.allow_ordering_pages = false

  # Shows the social media entry in the primary navigation
  self.show_social_media = false

  # Shows the analytics entry in the primary navigation (for admins only)
  self.show_analytics = false
end
