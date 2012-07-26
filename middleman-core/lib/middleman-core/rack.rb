module Middleman
  class Rack
    def initialize(options={}, &block)
      @options = options
      @config_block = block
      
      # Register watcher responder
      # watcher.on_reload(&:reload_instance!)
      
      reload_instance!
    end
    
    def call(env)
      @inst.call(env)
    end
    
    def reload_instance!
      # @options?
      @inst = ::Middleman::Application.server.inst(&@config_block)
    end
  end
end