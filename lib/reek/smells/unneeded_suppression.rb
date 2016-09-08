# frozen_string_literal: true

module Reek
  module Smells
    #
    # An unneeded suppression is a Reek's comment disabling a unexistent smell.
    #
    # See {file:docs/Unneeded-Suppression.md} for details.
    class UnneededSuppression
      def initialize(context, smell_detector)
        @context = context
        @smell_detector = smell_detector
      end

      def sniff
        if @smell_detector.sniff(@context).empty?
          exp = @context.exp
          ctx_source = exp.loc.expression.source_buffer.name
          [SmellWarning.new(self,
                            source: ctx_source,
                            context: @context.full_name,
                            lines: [exp.line],
                            message: message,
                            parameters: {})]
        else
          []
        end
      end

      def message
        "has an unneeded suppression of #{@smell_detector.smell_type}"
      end

      def smell_type
        self.class.name.split(/::/).last
      end
    end
  end
end
