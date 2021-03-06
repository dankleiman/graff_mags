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
//= require jquery_ujs
//= require jquery-ui
//= require foundation
//= require autocomplete-rails
//= require_tree .

$(function() {
  $(document).foundation();

  $('.reveal-modal').on('opened', function() {
    $(window).trigger('reflow');
  });



  //defaults to hidden section
  $('.issue-details').hide();
  //reveals more fields for data entry
  $(".details a").click(function(event){
    event.preventDefault();
    $('.issue-details').toggle();
    $('p').toggle();
  });

  //display cover based on thumbnail click
  $('.featured-back-cover').hide();

  $(".back-cover a").click(function(event){
    event.preventDefault();
    $('.featured-front-cover').hide();
    $('.featured-back-cover').show();
  });

  $(".front-cover a").click(function(event){
    event.preventDefault();
    $('.featured-front-cover').show();
    $('.featured-back-cover').hide();
  });
});
