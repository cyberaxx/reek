require_relative '../../spec_helper'

require_lib 'reek/smells/unneeded_suppression'

RSpec.describe Reek::Smells::UnneededSuppression do
  it 'reports the right values' do
    src = <<-EOS
      # :reek:UncommunicativeVariableName:
      def alfa
      end
    EOS

    expect(src).to reek_only_of(:UnneededSuppression,
                                lines: [2],
                                context: 'alfa',
                                message: 'Unneeded suppression of UncommunicativeVariableName',
                                source: 'string')
  end

  it 'counts all occurences' do
    src = <<-EOS
      # :reek:UncommunicativeVariableName:
      def alfa; end

      # :reek:UncommunicativeVariableName:
      def bravo; end
    EOS

    expect(src).to reek_only_of(:UnneededSuppression,
                                lines: [2],
                                context: 'alfa')

    expect(src).to reek_only_of(:UnneededSuppression,
                                lines: [5],
                                context: 'bravo')
  end
end
