# https://github.com/rails/rails/blob/main/activesupport/lib/active_support/core_ext/erb/util.rb
module ERBUtilExt
  def html_escape_once(s)
    super(AngularXss::Escaper.escape_if_unsafe(s))
  end

  def unwrapped_html_escape(s)
    super(AngularXss::Escaper.escape_if_unsafe(s))
  end

  # Note that html_escape() and h() are passively fixed as they are calling the two methods above
end
ERB::Util.prepend ERBUtilExt
ERB::Util.singleton_class.prepend ERBUtilExt
