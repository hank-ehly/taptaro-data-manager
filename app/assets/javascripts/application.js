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
