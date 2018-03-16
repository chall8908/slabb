import "normalize.css";
import "tomorrow-css/css/tomorrow_night.css";
import Turbolinks from "turbolinks";
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

import "fontawesome-pro-5.0.2/web-fonts-with-css/css/fontawesome-all.min.css";
import "fontawesome-pro-5.0.2/svg-with-js/css/fa-svg-with-js.css";
import "fontawesome-pro-5.0.2/svg-with-js/js/fontawesome-all.min";
import "./application.css";
// eslint-disable-next-line
import "devise/sessions/sessions.css";

// Remove the no JS warning if they have JS turned on.  :D
window.onload = function() {
  document.querySelector(".alert--notice-no-js").remove();

  Turbolinks.start();

  const application = Application.start();
  const context = require.context(".", true, /.js$/);
  application.load(definitionsFromContext(context));
};
