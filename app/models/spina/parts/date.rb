module Spina
  module Parts
    class Date < Base
      attr_json :content, :date, default: ""
    end
  end
end