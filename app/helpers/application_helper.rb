module ApplicationHelper
  def link_to_button path, type
    case type
      when :delete
        link_to raw(icon('trash', t('general.delete'))), path, data: {:confirm => t('general.confirm_dialog')}, :method => :delete, class: 'deletebtn'
      when :edit
        link_to raw(icon('pencil-square-o', t('general.edit'))), path, class: 'normalbtn'
      when :new
        link_to raw(icon('plus', t('general.new'))), path, class: 'normalbtn'
      when :save
        button_tag(type: 'submit', class: 'savebtn') do
          icon('floppy-o', t('general.save'))
        end
      when :back
        link_to raw(icon('chevron-left', t('general.back'))), path, class: 'normalbtn'
      else
        link_to raw('Button not defined!'), path, class: 'normalbtn'
    end
  end

  def loading_indicator
    '<div id="circleG">
      <div id="circleG_1" class="circleG"></div>
      <div id="circleG_2" class="circleG"></div>
      <div id="circleG_3" class="circleG"></div>
    </div>'.html_safe
  end

  def modal_options modal_div_id
    {
        :remote => true,
        'data-toggle' => 'modal',
        'data-target' => modal_div_id,
        'data-type' => 'html'
    }
  end
end
