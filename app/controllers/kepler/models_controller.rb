module Kepler
  class ModelsController < Kepler::ApplicationController

    def index
    end

    def graph
      require 'railroady'

      diagram = ModelsDiagram.new
      diagram.generate

      graph = diagram.instance_eval { @graph }
      nodes = graph.instance_eval { @nodes }
      links = graph.instance_eval { @edges }

      data = { links: [] }
      data[:nodes] = nodes.map { |type, name, attrs| { name: name } }
      map = Hash[ data[:nodes].each_with_index.map { |d,i| [d[:name], i] } ]
      links.each do |type, from, to, _| 
        source, target = map[from], map[to]
        if source && target
          data[:links] << { source: source, target: target }
        else
          # TODO: figure out what to do about base classes / wherever else this happens
        end
      end
      render :json => data
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