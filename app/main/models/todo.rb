class Todo < Volt::Model
  validate :name, length: 5
end
