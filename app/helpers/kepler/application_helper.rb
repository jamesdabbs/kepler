module Kepler
  module ApplicationHelper
    def format_source(path)
      CodeRay.scan(File.read(path), :ruby).div(:line_numbers => :table)
    end
  end
end
