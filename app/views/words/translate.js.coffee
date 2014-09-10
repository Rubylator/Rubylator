$(document).ready ->
  $('<%= "#word_#{@word.id}" %>').val('<%= j @word.text.html_safe %>')
  $('<%= "#loading_#{@word.id}" %>').addClass('hidden')