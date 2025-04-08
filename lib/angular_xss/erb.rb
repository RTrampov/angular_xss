# Use module_eval so we crash when ERB::Util has not yet been loaded.
ERB::Util.module_eval do
  def unwrapped_html_escape_with_escaping_angular_expressions(s)
    s = s.to_s
    if s.html_safe?
      s
    else
      unwrapped_html_escape_without_escaping_angular_expressions(AngularXss::Escaper.escape(s))
    end
  end

  alias_method :unwrapped_html_escape_without_escaping_angular_expressions, :unwrapped_html_escape
  alias_method :unwrapped_html_escape, :unwrapped_html_escape_with_escaping_angular_expressions

  singleton_class.send(:remove_method, :unwrapped_html_escape)
  module_function :unwrapped_html_escape
  module_function :unwrapped_html_escape_without_escaping_angular_expressions
end
