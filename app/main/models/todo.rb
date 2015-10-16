class Todo < Volt::Model
  own_by_user
  validate :name, length: 5

  permissions do
    deny unless owner?
  end
end
