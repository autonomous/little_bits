class Json < Virtus::Attribute
  def coerce(value)
    value.is_a?(::Hash) ? value : MultiJson.parse(value)
  end
end
