$(document).ready(function() {
  $('li[event-id].start:not([stacked])').each(function() {

    var evNum = $(this).attr('event-id');
    var evLev;
    var evLevA = [];

    $('li[event-id=' + '"' + evNum + '"]:not([stacked])').each(function(){
      var evLevN = $(this).attr('stack-level');
      evLevA.push(parseInt(evLevN));
    });

    evLev = Math.max.apply(Math, evLevA);
    $('li[event-id=' + '"' + evNum + '"]:not([stacked])').addClass('ev_' + evLev).attr('stacked', '');
    
    evLevA = [];
  });
});