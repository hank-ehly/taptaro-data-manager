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
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).on('turbolinks:load', function () {

    var y = {
        female: {
            audio_clip: document.getElementById('female_audio_clip'),
            iconSelector: '#female_play_icon'
        },
        slow_female: {
            audio_clip: document.getElementById('slow_female_audio_clip'),
            iconSelector: '#slow_female_play_icon'
        },
        male: {
            audio_clip: document.getElementById('male_audio_clip'),
            iconSelector: '#male_play_icon'
        },
        slow_male: {
            audio_clip: document.getElementById('slow_male_audio_clip'),
            iconSelector: '#slow_male_play_icon'
        }
    };

    for (var x in y) {
        if (!x.audio_clip) continue;

        var icon = $(x.iconSelector);
        icon.on('click', function () {
            x.audio_clip.play();
        });

        x.audio_clip.onplaying = function () {
            x.audio_clip.enabled(false);
        };

        x.audio_clip.onended = function () {
            x.audio_clip.enabled(true);
        };

        x.audio_clip.enabled = function (shouldEnable) {
            $(x.audio_clip).prop('disabled', !shouldEnable);
        };
    }

    var $sortable = $('.sortable');

    function sortUpdate() {
        var updated_order = [];
        set_positions();

        $('.draggable').each(function (i) {
            updated_order.push({
                id: $(this).data('id'),
                position: i + 1
            });
        });

        var url = '';
        if ($sortable.data('category_id')) {
            url = '/categories/' + $sortable.data('category_id') + '/category_items/sort';
        } else {
            url = '/categories/sort';
        }

        if (url === '') {
            console.error('Something went wrong.', url, $sortable);
            return;
        }

        $.ajax({
            type: 'PUT',
            url: url,
            data: {order: updated_order}
        });
    }

    $sortable.sortable().bind('sortupdate', sortUpdate);

    var set_positions = function () {
        $('.draggable').each(function (i) {
            $(this).attr('data-pos', i + 1);
        });
    };

    set_positions();
});
