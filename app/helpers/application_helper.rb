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

  def modal_options modal_div_id
    {
        :remote => true,
        'data-toggle' => 'modal',
        'data-target' => modal_div_id,
        'data-type' => 'html'
    }
  end


  # Source: gem font-awesome-sass: https://github.com/FortAwesome/font-awesome-sass
  def icon(icon, text='', html_options={})
    content_class = "fa fa-#{icon}"
    content_class << " #{html_options[:class]}" if html_options.key?(:class)
    html_options[:class] = content_class
    html = content_tag(:i, nil, html_options)
    html << " #{text}" unless text.blank?
    html.html_safe
  end
end
