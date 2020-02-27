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
// require jquery
//= require js/jquery.min
//= require jquery_ujs
//= require js/bootstrap.min
//= require fastclick
//= require nprogress
//= require js/dropzone.min
//= require custom
//= require switchery.min
//= require bootstrap-wysihtml5
//= require_tree .

$(document).ready(function(){
  // disable auto discover
  Dropzone.autoDiscover = false;
 

  var dropzone = new Dropzone (".dropzone", {
    maxFilesize: 256, // Set the maximum file size to 256 MB
    // paramName: "image[avatar]", // Rails expects the file upload to be something like model[field_name]
    // addRemoveLinks: true // Don't show remove links on dropzone itself.
  }); 

  dropzone.on("success", function(file) {
    this.removeFile(file)
    
    // $.getScript("/admin/posts/4/edit")
  })
});
