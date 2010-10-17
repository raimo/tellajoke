// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$.ajaxSetup({
cache: false
});


$(document).ready(function() {
    $('textarea').autogrow();
    $('input[placeholder],textarea[placeholder]').placeholder();
    $('textarea').maxlength( {maxCharacters: 300} );
    $('.comments').commenter();
});


