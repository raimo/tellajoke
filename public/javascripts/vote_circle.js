(function($) {
  $.fn.voteCircle = function(options) {
    var options = jQuery.extend({
        hotList : "",
        valueMap: {}
    }, options);
    return this.each(function() {
      var container = this;

      $(container).find('.vote-circle ').tooltip({});
      $(container).find('.vote-circle').click(function() {
        
        $.get($(container).find('a:first').attr('href') + '/votes/cast', function (data) {
          $('.tooltip').remove();
          $(options.hotList).html(data);
        });
        return false;
      });
    });
  };
})(jQuery);
