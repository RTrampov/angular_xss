angular_xss [![Build Status](https://github.com/RTrampov/angular_xss/workflows/Tests/badge.svg)](https://github.com/RTrampov/angular_xss/actions)
===========

Fork of [makandra/angular_xss](https://github.com/makandra/angular_xss) with removed HAML dependency. 

When rendering AngularJS templates with a server-side templating engine like ERB it is easy to introduce XSS vulnerabilities. These vulnerabilities are enabled by AngularJS evaluating user-provided strings containing interpolation symbols (default symbols are `{{` and `}}`).

This gem patches ERB/rails_xss so Angular interpolation symbols are auto-escaped in unsafe strings. And by auto-escaped we mean replacing `{{` with `{{ $root.DOUBLE_LEFT_CURLY_BRACE }}`. To leave AngularJS interpolation marks unescaped, mark the string as `html_safe`.

**This is an unsatisfactory hack.** A better solution is very much desired, but is not possible without some changes in AngularJS. See the [related AngularJS issue](https://github.com/angular/angular.js/issues/5601).


Disable escaping locally
------------------------

If you want to disable angular_xss in some part of your app, you can use

```
AngularXss.disable do
  # no escaping here
end
# escaped again
```


Installation
------------

0. Read the code so you know what you're getting into.

1. Put this into your Gemfile **after other templating engines**:

        gem 'angular_xss'

2. Run `bundle install`.

3. Add this to your Angular code (replacing "myApp" of course):

   ```
   angular.module('myApp', []).run(['$rootScope', function($rootScope) {
     $rootScope.DOUBLE_LEFT_CURLY_BRACE = '{{';
   }]);
   ```

4. Run your test suite to find the places that broke.

5. Mark any string that is allowed to contain Angular expressions as `#html_safe`.


Development
-----------

- Fork the repository.
- Push your changes with specs.
- You may run single tests with a specified Rails version via `BUNDLE_GEMFILE=Gemfile.rails-5.2 bundle exec rspec ./spec/angular_xss`
- Send a pull request.


Credits
-------

[Henning Koch](mailto:henning.koch@makandra.de) from [makandra](http://makandra.com/).
