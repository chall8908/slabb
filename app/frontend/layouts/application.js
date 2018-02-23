import "normalize.css";
import "tomorrow-css/css/tomorrow_night.css";
import Rails from "rails-ujs";

import "fontawesome-pro-5.0.2/web-fonts-with-css/css/fontawesome-all.min.css";
import "fontawesome-pro-5.0.2/svg-with-js/css/fa-svg-with-js.css";
import "fontawesome-pro-5.0.2/svg-with-js/js/fontawesome-all.min";
import "./application.css";

Rails.start();

// Remove the no JS warning if they have JS turned on.  :D
window.onload = function() {
  document.getElementsByClassName("alert--notice-no-js")[0].remove();
};
