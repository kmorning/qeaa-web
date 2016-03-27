class DatepickerInput < SimpleForm::Inputs::StringInput
  # Builds options for the dateicker input, sets it's value using
  # Rails's date format and adds behaviour: 'datepicker' to its date-atrributes.
  def input_html_options
    value = object.send(attribute_name)
    options = {
      value: value.nil? ? nil : value.strftime("%Y-%m-%d"),
      data: { behaviour: 'datepicker' }  # for example
    }
    # add all html option you need...
    super.merge options
  end

  # Adds the "datepicker" class to the input element
  def input_html_classes
    super.push('datepicker')
  end

  # Builds the input text field and an hidden field with class attribute_name-alt 
  def input(wrapper_options)
    @builder.text_field(attribute_name, input_html_options) + \
    @builder.hidden_field(attribute_name, value: input_html_options[:value], class: attribute_name.to_s + "-alt")
  end
end 

