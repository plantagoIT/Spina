module Spina
  module Admin
    module AdminHelper

      def icon name, id = nil
        if id.nil?
          content_tag(:i, nil, class: "icon icon-#{name}")
        else
          content_tag(:i, nil, class: "icon icon-#{name}", id: "#{id[:id]}")
        end
      end
    end
  end
end
