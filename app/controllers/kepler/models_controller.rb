module Kepler
  class ModelsController < Kepler::ApplicationController
    def index
      require 'railroady'

      @data = ModelsDiagram.new
      @data.generate
      
      @graph = @data.instance_eval  { @graph }
      @nodes = @graph.instance_eval { @nodes }
      @edges = @graph.instance_eval { @edges }
    end

    def show
      @model = params[:name].constantize
    end

    private

    def get_model(filename)
      klass = filename.sub(/\.rb$/, '').split('/').map {|t| t.camelize}.join('::').constantize
      klass.ancestors.include?(ActiveRecord::Base) ? klass : nil
    end
  end
end