require "markitup/version"

module Typus
  module Markitup
    if defined?(Rails)
      require 'markitup/engine'
      require 'markitup/version'
    end

    if defined?(ActiveRecord)
      require 'markitup/class_methods'
      ActiveRecord::Base.extend(Typus::Markitup::ClassMethods)
    end

  end
end
