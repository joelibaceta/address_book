$('.letter_item').ready ->
  $('.letter_item').on 'click', ->
    console.log $(this).attr('letter')
    arr_first_name = $('div[first_name^=\'l_\']')
    arr_last_name = $('div[last_name^=\'l_\']')
    arr_first_name.appendTo $('#no-filtered')
    arr_last_name.appendTo $('#no-filtered')
    arr_first_name = $('div[first_name^=\'l_' + $(this).attr('letter') + '\']')
    arr_last_name = $('div[last_name^=\'l_' + $(this).attr('letter') + '\']')
    arr_first_name.appendTo $('#masonry-container')
    arr_last_name.appendTo $('#masonry-container')
    $('#masonry-container').masonry('reload')
    return
  return