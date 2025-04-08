describe 'Angular XSS prevention in ERB', :type => :view do
  it_should_behave_like 'engine preventing Angular XSS', :partial => 'test_erb'
end

describe ERB::Util do
  describe '#html_escape' do
    it 'escapes angular braces' do
      expect(described_class.html_escape("{{unsafe}}")).to eq("{{ $root.DOUBLE_LEFT_CURLY_BRACE }}unsafe}}")
    end

    it 'does not modify already HTML safe strings' do
      expect(described_class.html_escape("{{safe}}".html_safe)).to eq("{{safe}}")
    end
  end

  describe '#h' do
    it 'escapes angular braces' do
      expect(described_class.h("{{unsafe}}")).to eq("{{ $root.DOUBLE_LEFT_CURLY_BRACE }}unsafe}}")
    end

    it 'does not modify already HTML safe strings' do
      expect(described_class.h("{{safe}}".html_safe)).to eq("{{safe}}")
    end
  end

  if described_class.method_defined? :unwrapped_html_escape
    describe '#unwrapped_html_escape' do
      it 'escapes angular braces' do
        expect(described_class.unwrapped_html_escape("{{unsafe}}")).to eq("{{ $root.DOUBLE_LEFT_CURLY_BRACE }}unsafe}}")
      end

      it 'does not modify already HTML safe strings' do
        expect(described_class.unwrapped_html_escape("{{safe}}".html_safe)).to eq("{{safe}}")
      end
    end
  end
end
