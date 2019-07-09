'use strict';

$(document).ready(function () {

    /*
     * Delete movie
     */
    $(".delete-movie").click(function () {
        var id = $(this).attr("id");
        if (confirm("This action cannot be reversed.")) {
            $.ajax("/movies/delete/" + id, {
                method: "DELETE",
                success: function (data, status, jqXHR) {
                    location.reload();
                },
                error: function (jqXHR, status, error) {
                    alert(error);
                }
            })
        }
    });

    /*
     * Delete Category
     */
    $(".delete-category").click(function () {
        var id = $(this).attr("id");
        if (confirm("This action cannot be reversed.")) {
            $.ajax("/categories/delete/" + id, {
                method: "DELETE",
                success: function (data, status, jqXHR) {
                    location.reload();
                },
                error: function (jqXHR, status, error) {
                    alert(error);
                }
            })
        }
    });
});