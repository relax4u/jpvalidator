ActiveRecord::Schema.define(:version => 1) do
  create_table :notes, :force => true do |t|
    t.string :title
    t.text :body
  end
end

