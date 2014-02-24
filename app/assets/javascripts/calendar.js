$(document).ready(function() {

  var evWeekLev = [];
  var i = 0;
  $('tr.week').each(function() {
    $(this).attr('week', i);
    $(this).children().children().children('li[event-id].start:not([stacked])').each(function() {

      var evNum = $(this).attr('event-id');
      var evLev;
      var evLevA = [];

      $('li[event-id=' + '"' + evNum + '"]:not([stacked])').each(function(){
        var evLevN = $(this).attr('stack-level');
        evLevA.push(parseInt(evLevN));
      });

      evLev = Math.max.apply(Math, evLevA);
      $('li[event-id=' + '"' + evNum + '"]:not([stacked])').addClass('ev_' + evLev).attr('stacked', '');
      evWeekLev.push(evLev);
      evLevA = [];
    });
    if (evWeekLev < 1) {
    } else {
      var zz = Math.max.apply(Math, evWeekLev) +1;
      $('tr[week="' + i +'"').addClass('events' +zz);
    }
    i++;
    evWeekLev = [];
  });

});
