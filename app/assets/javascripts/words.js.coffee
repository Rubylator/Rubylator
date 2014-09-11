#fix source http://stackoverflow.com/questions/17600093/rails-javascript-not-loading-after-clicking-through-link-to-helper

jQuery ->
  ready = () ->
    $('.translatebtn').click ->
      id = this.id.split('_')[1]
      tag = $('#btn_'+id).find('i')
      tag.addClass('fa-spin')
    $('.words_onchange').change () -> $(this).trigger('submit.rails')

  $(document).ready(ready);
  $(document).on('page:load', ready);
