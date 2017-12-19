# Small, Lightweight, Accessible Bulliten Board

A minimal board for minimal needs

## Dependencies

### Database

SLABB is designed on top of the PostgreSQL database.  You should install, at
least, `libpq` or the equivalent for your system.

### Other Runtime Dependencies

SLABB depends on [nokogiri](http://www.nokogiri.org/tutorials/installing_nokogiri.html),
which can be a pain to install if you're unfamiliar with it.

### Development and Build Dependencies

SLABB uses [Webpacker](https://github.com/rails/webpacker) for managing
JavaScript and CSS.  As such, a version of node.js is required.  Note that this
is only required for the build step and should not be necessary to actually run
the server in a production setting.

When developing, a separate webpack dev server is run alongside Rails to handle
compilation of JavaScript files.  As such, you will need both node AND ruby to
run the development server.

For testing, SLABB uses [Capybara with Selenium](http://www.rubydoc.info/github/teamcapybara/capybara#selenium).
By default, the test framework will use Chrome with [Chromedriver](https://sites.google.com/a/chromium.org/chromedriver/downloads).
Firefox may also be used to run the tests, provided you alter your local copy
of the `spec/rails_helper.rb` file to point to the correct driver.
