module Kepler
  class ModelsController < Kepler::ApplicationController
    def index
      Dir.chdir(Rails.root.join('app/models')) do
        @models = Dir['**/*.rb'].map {|f| get_model(f)}.compact
      end
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