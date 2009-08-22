class ActiveRecord::Errors
  def add_on_jp_blank(attributes, custom_message = nil)
    for attr in [attributes].flatten do
      value = @base.respond_to?(attr.to_s) ? @base.send(attr.to_s) : @base[attr.to_s]
      add(attr, :blank, :default => custom_message) if value.jp_blank?
    end
  end
end

