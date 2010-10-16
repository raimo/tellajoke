(function($) {
  $.fn.voteCircle = function(options) {
    var options = jQuery.extend({
        hotList : "",
        valueMap: {}
    }, options);
    return this.each(function() {
      var container = this;
      $(this).find('.vote-circle').click(function() {
        
        $.get($(container).find('a:first').attr('href') + '/votes/cast', function (data) {
          $(options.hotList).html(data);
        });
        return false;
      });
    });
  };
})(jQuery);
