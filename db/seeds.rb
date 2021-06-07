Course.delete_all()
Genre.delete_all()
Level.delete_all()
Teacher.delete_all()
Gender.delete_all()

gender_ids = []
gender_ids << Gender.create(name: "男性").id
gender_ids << Gender.create(name: "女性").id
puts("----- Seed Gender completed. -----")

teacher_ids = []
1.upto(10) do |i|
  obj = Teacher.new
  obj.name = "講師 #{i}"
  obj.phone_number = "01-2345-6789"
  obj.gender_id = gender_ids.sample
  obj.save
  teacher_ids << obj.id
end
puts("----- Seed Teacher completed. -----")

level_ids = []
level_ids << Level.create(name: "初級").id
level_ids << Level.create(name: "中級").id
level_ids << Level.create(name: "上級").id
puts("----- Seed Level completed. -----")

genre_ids = []
genre_ids << Genre.create(name: "Ruby").id
genre_ids << Genre.create(name: "Ruby on Rails").id
genre_ids << Genre.create(name: "Python").id
genre_ids << Genre.create(name: "Django").id
genre_ids << Genre.create(name: "ゲーム").id
genre_ids << Genre.create(name: "仮想通貨").id
genre_ids << Genre.create(name: "Web").id
genre_ids << Genre.create(name: "スマートフォンアプリ").id
puts("----- Seed Genre completed. -----")

1.upto(10) do |i|
  obj = Course.new
  obj.name = "コース #{i}"
  obj.teacher_id = teacher_ids.sample
  obj.level_id = level_ids.sample
  obj.genre_id = genre_ids.sample
  obj.save
end
puts("----- Seed Course completed. -----")
