// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require foundation
//= require moment
//= require fullcalendar
//= require underscore-min
//= require markerclustererplus/src/markerclusterer_packed.js
// require infobox/src/infobox_packed.js
//= require gmaps/google
//= require_tree .
//MarkerClusterer.IMAGE_PATH = '/assets/markerclustererplus/images/m'

$(function() {
  $(document).foundation();
});

document.addEventListener("turbolinks:load", function() {
  jQuery(function(){
    $(document).foundation();
  });
});

$(document). on("page:load ready", function(){
  $("input.datepicker").each(function(input) {
    $(this).datepicker({
      dateFormat: "yy-mm-dd",
      altField: $(this).next(),
      altFormat: "yy-mm-dd"
    })
  })
})
