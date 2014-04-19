$('.edit_podcast').on 'change', ({originalEvent}) ->
  $.post $(@).attr('action'), { episodes: originalEvent.fpfiles }, ->
    window.location = window.location
