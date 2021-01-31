/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$( function() {
    $("#type_user").change( function() {
        if ($(this).val() === "administrador") {
            $("#name_user").prop("disabled", false);
            $("#pass_user").prop("disabled", false);
        } else if ($(this).val() === "cajero") {
            $("#name_user").prop("disabled", false);
            $("#pass_user").prop("disabled", false);
        } else {
            $("#name_user").prop("disabled", true);
            $("#pass_user").prop("disabled", true);
        }
    });
});