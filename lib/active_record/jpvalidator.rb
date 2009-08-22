module ActiveRecord
  module Jpvalidator
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def enable_jpvalidator(options = {})
        extend(Validations::ClassMethods)
        class << self
          alias_method_chain :validates_presence_of, :jpvalidator
        end
      end
    end

    module Validations
      module ClassMethods
        def validates_presence_of_with_jpvalidator(*attr_names)
          configuration = attr_names.extract_options!

          if (configuration.delete(:ignore_jp_space))
            configuration.reverse_merge!({:on => :save})

            send(validation_method(configuration[:on]), configuration) do |record|
              record.errors.add_on_jp_blank(attr_names, configuration[:message])
            end
          else
            attr_names << configuration
            validates_presence_of_without_jpvalidator(*attr_names)
          end
        end
      end
    end
  end
end

