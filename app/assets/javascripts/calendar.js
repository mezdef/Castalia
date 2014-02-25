$(document).ready(function() {

  // WEEK PASS /////////////////////////////////////////////////////
  $('tr.week').each(function(i, week) {
    $(week).attr('week', i);
    // DAY PASS ////////////////////////////////////////////////////
    $(week).children('td[day]').each(function(ii, day) {
      // EVENT PASS ////////////////////////////////////////////////
      $(day).children().children('li[event-id]').each(function(iii, event) {
        $(event).attr('natural-level', iii);
      });
    });
      

    var eventsUnique = {};
    var eventsList = [];
    // UNIQUE EVENTS ///////////////////////////////////////////////
    $(week).find('li[event-id]').each(function(ii, event) {
      if (! eventsUnique[$(event).attr('event-id')]) {
        eventsUnique[$(event).attr('event-id')] = true;
        eventsList.push($(event).attr('event-id'));
      } else {
      }
    });

    var stackLevel = [];
    var stackLevelMax = 0;
    // STACK LEVEL /////////////////////////////////////////////////
    $.each(eventsList, function(ii, id) {
      $('li[event-id="' + id + '"]').each(function (iii, event) {
        var stackLevelString = $(event).attr('natural-level');
        stackLevel.push(parseInt(stackLevelString));
      });
      stackLevelMax = Math.max.apply(Math, stackLevel);
      $('li[event-id="' + id + '"]').attr('stack-level', stackLevelMax);

        stackLevelMax++;
    });

    // STACK LEVEL FLOATERS ////////////////////////////////////////
    $(week).find('li[event-id]').each(function(ii, event) {
      if (($(event).attr('stack-level')) <= ($(event).prev().attr('stack-level'))) {
        var passThroughStack = $(event).prev().attr('stack-level');
        $(event).attr('stack-level', parseInt(passThroughStack)+1);
        stackLevelMax++;

        var id = $(event).attr('event-id');
        // stackLevel.push(parseInt(stackLevelString));
        $(week).find('li[event-id="' + id + '"]').each(function(iii, member) { 
          $(member).attr('stack-level', parseInt(passThroughStack)+1);
        });
      }
    });

    // STACK LEVEL RECHECK /////////////////////////////////////////

    // WEEK SIZE ///////////////////////////////////////////////////
    if (stackLevelMax == 0) {
      $(week).attr('events', 0);
    } else {
      $(week).attr('events', stackLevelMax);
    }

    var stackLevelMin = 0;
    $(week).find('li[event-id]').each(function(ii, event) {
      var stackLevelZero = [];
      var noLevelZero = $(event).attr('stack-level');
      stackLevelZero.push(parseInt(noLevelZero));
      stackLevelMin = Math.min.apply(Math, stackLevelZero);
      console.log(stackLevelMin);
    });

    // if (stackLevelMin != 0) {
    //   $(week).find('li[event-id]').each(function (iii, member) {
    //     var stackLevelNotZero = $(member).attr('stack-level');
    //     $(member).attr('stack-level', parseInt(stackLevelNotZero)-1);
    //   });

    // }
    // var eventCount = $(week).children('td').children('ul').children('li').length;
    // console.log(eventCount);
    // $(week).attr('events', eventCount);



  });

});
