(function($) {
  $.fn.voteCircle = function(options) {
    var options = jQuery.extend({
        strKey : "",
        valueMap: {}
    }, options);
    return this.each(function() {
      var container = this;
      $(this).find('.vote-circle').click(function() {
        
        $.get($(container).find('a:first').attr('href') + '/votes/create', function (data) {
          alert(data);
        });
        return false;
      });
    });
  };
})(jQuery);
