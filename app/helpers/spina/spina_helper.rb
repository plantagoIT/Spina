module Spina::SpinaHelper

  def spina_include_tags
    safe_join [
      javascript_include_tag("stimulus/libraries/es-module-shims", type: "module"),
      tag.script(type: "importmap-shim", src: asset_path("spina/importmap.json")),
      javascript_include_tag("stimulus/libraries/stimulus", type: "module-shim"),
      javascript_include_tag("spina/libraries/trix")
    ], "\n"
  end
  
  def autoloader_include_tag
    javascript_include_tag("stimulus/loaders/autoloader", type: "module-shim")
  end

  # Create meta-titles for pages in the CMS using the pages path.
  # Params:
  # +title+:: Creates a title using the path by excluding '/admin', puts 'edit' and 'new' keyword in the front, excluding numbers from ids and capitalizing all words
  def admin_title
    title = (request.fullpath.split('/')[2..].reverse.collect{|s| s.capitalize if s.match('\d').nil? }).join(' ')
    "#{title} · SpinaCMS"
  end

end