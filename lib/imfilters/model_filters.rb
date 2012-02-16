module Imfilters
  module ModelFilters
    extend ActiveSupport::Concern

    included do
      class_attribute :filters_configuration, :instance_writer => false
    end

    module ClassMethods
      def model_filter(*filters, &block)
        options = filters.extract_options!
        options.symbolize_keys!
        options.assert_valid_keys(:type)

        self.filters_configuration = (self.filters_configuration || {}).dup

        filters.each do |filter|
          target_class = self
          if filter.is_a?(Array)
            joins = filter.dup
            field = joins.pop

            # traverse through associations
            joins.each do |assoc|
              target_class = target_class.reflect_on_association(assoc).class_name.constantize
            end
            name = filter.join('_')

            # convert array into nested hash suitable for joins
            # [1, 2, 3, 4] into {1 => {2 => {3 => 4}}}
            (joins.size - 1).times { joins << Hash[*joins.pop(2)] }
          else
            joins = []
            field = name = filter
          end

          options[:type] ||= :like
          self.filters_configuration[filter] = options

          case options[:type]
          when :like
            condition = lambda {|val| "LIKE(#{quote_value('%' + val + '%')})"}
          else
            raise "Not known type"
          end

          self.scope "filter_by_%s" % name,
            lambda { |val|
              joins(joins).where("#{target_class.table_name}.#{field} #{condition.call(val)}")
            }
        end
      end
    end

  end
end

ActiveRecord::Base.send :include, Imfilters::ModelFilters
