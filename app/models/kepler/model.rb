module Kepler
  class Model < SimpleDelegator
    def initialize(name)
      super name.constantize
    end

    def sources
      files = Set.new
      __getobj__.methods.each do |name|
        m = __getobj__.method(name).source_location
        next if m.nil?
        files << m.first 
      end
      files.grep /\/app\//
    end
  end
end