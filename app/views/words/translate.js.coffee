$(document).ready ->
  $('<%= "#word_#{@word.id}" %>').val('<%= j @word.text.html_safe %>')
  tag = $('<%= "#btn_#{@word.id}" %>').find('i')
  tag.removeClass('fa-spin')
