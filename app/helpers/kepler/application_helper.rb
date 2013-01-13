module Kepler
  module ApplicationHelper
    def class_link(klass)
      link_to(klass.name, model_path(klass.name))
    end
    
    def format_source(path)
      CodeRay.scan(File.read(path), :ruby).div(:line_numbers => :table)
    end
  end
end
