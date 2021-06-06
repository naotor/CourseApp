Teacher.delete_all()
Gender.delete_all()

gender_ids = []
gender_ids << Gender.create(name: "男性").id
gender_ids << Gender.create(name: "女性").id
# puts("----- Seed Gender completed. -----")

1.upto(10) do |i|
  obj = Teacher.new
  obj.name = "講師 #{i}"
  obj.phone_number = "01-2345-6789"
  obj.gender_id = gender_ids.sample
  obj.save
end
# puts("----- Seed Teacher completed. -----")
