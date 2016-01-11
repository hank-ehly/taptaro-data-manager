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

    // Female

    var female_audio_clip = document.getElementById('female_audio_clip');
    var female_play_icon = $('#female_play_icon');

    female_play_icon.on('click', function() {
       if (female_audio_clip) {
           female_audio_clip.play()
       }
    });

    female_audio_clip.onplaying = function(e) {
        female_audio_clip.enabled(false);
    };

    female_audio_clip.onended = function(e) {
        female_audio_clip.enabled(true);
    };

    female_audio_clip.enabled = function(shouldEnable) {
        $(female_audio_clip).prop('disabled', !shouldEnable);
    };


    // Male

    var male_audio_clip = document.getElementById('male_audio_clip');
    var male_play_icon = $('#male_play_icon');

    male_play_icon.on('click', function() {
        if (male_audio_clip) {
            male_audio_clip.play()
        }
    });

    male_audio_clip.onplaying = function(e) {
        male_audio_clip.enabled(false);
    };

    male_audio_clip.onended = function(e) {
        male_audio_clip.enabled(true);
    };

    male_audio_clip.enabled = function(shouldEnable) {
        $(male_audio_clip).prop('disabled', !shouldEnable);
    };

});