// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).on('page:load', function () {

    var audio_clip = document.getElementById('audio_clip');
    var play_icon = $('#play_icon');

    play_icon.on('click', function() {
       if (audio_clip) {
           audio_clip.play()
       }
    });

    audio_clip.onplaying = function(e) {
        audio_clip.enabled(false);
    };

    audio_clip.onended = function(e) {
        audio_clip.enabled(true);
    };

    audio_clip.enabled = function(shouldEnable) {
        $(audio_clip).prop('disabled', !shouldEnable);
    };

});