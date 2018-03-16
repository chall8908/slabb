import "normalize.css";
import "tomorrow-css/css/tomorrow_night.css";
import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

import "fontawesome-pro-5.0.2/web-fonts-with-css/css/fontawesome-all.min.css";
import "fontawesome-pro-5.0.2/svg-with-js/css/fa-svg-with-js.css";
import "fontawesome-pro-5.0.2/svg-with-js/js/fontawesome-all.min";
import "./application.css";

const application = Application.start();
const context = require.context(".", true, /.js$/);
application.load(definitionsFromContext(context));

// Remove the no JS warning if they have JS turned on.  :D
window.onload = function() {
  document.querySelector(".alert--notice-no-js").remove();
};
