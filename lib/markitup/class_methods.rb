module Typus
  module Markitup
    module ClassMethods

      def extended_modules
        (class << self; self end).included_modules
      end

      def typus_markitup(*args)
        cattr_accessor :typus_markitup_options, :typus_markitup_fields
        self.typus_markitup_fields  ||= []
        self.typus_markitup_options ||= {}

        options = args.extract_options!

        args.each do |field|
          self.typus_markitup_fields << field
          self.typus_markitup_options[field] = options
        end

        extend TemplateMethods unless extended_modules.include?(TemplateMethods)
      end
    end

    module TemplateMethods
      def typus_template(attribute)
        if self.typus_markitup_fields.include? attribute.to_sym
          'markitup'
        else
          super(attribute)
        end
      end

    end
  end
end
