module ApplicationHelper
  def link_to_button controller, type
    case type
      when :delete
        link_to raw(icon('trash', t('general.delete'))), controller, data: {:confirm => t('general.confirm_dialog')}, :method => :delete, class: 'deletebtn'
      when :edit
        link_to raw(icon('pencil-square-o', t('general.edit'))), controller, :method => :edit, class: 'normalbtn'
      when :new
        link_to raw(icon('plus', t('general.new'))), controller, class: 'normalbtn'
      when :save
        button_tag(type: 'submit', class: 'savebtn') do
          icon('floppy-o', t('general.save'))
        end
      when :back
        link_to raw(icon('chevron-left', t('general.back'))), controller, class: 'normalbtn'
      else
        link_to raw('Button not defined!'), controller, class: 'normalbtn'
    end
  end
end
