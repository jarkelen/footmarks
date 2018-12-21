class BaseDecorator
  def initialize(object, template)
    @object = object
    @template = template
  end

  def self.decorates(name)
    define_method(name) do
      @object
    end
  end

  def method_missing(*args, &block)
    @template.send(*args, &block)
  end

  def data_field(value, field_type=false)
    case field_type
    when "date"
      value = value.blank? ? "-" : value.strftime("%d-%m-%Y")
    when "amount"
      value = value.blank? ? "-" : number_to_currency(value, precision: 2, separator: '.')
    when "boolean"
      if value == true
        value = "<span class='icon-ok'></span>".html_safe
      else
        value = "-"
      end
    else
      value = value.blank? ? "-" : value
    end
    value
  end

  def label(label)
    "#{label}:"
  end

  def flag(country)
    country = country.gsub(' ','').downcase
    if country == "other"
      image_tag("flags/eu.png")
    else
      image_tag("flags/#{country}.png")
    end
  end

end
