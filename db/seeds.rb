require 'csv'

course_table = CSV.read('./db/course_list.csv', headers: true)
subject_table = CSV.read('./db/subject_list.csv', headers: true)

gender_ids = []
gender_ids << Gender.create(name: "男性").id
gender_ids << Gender.create(name: "女性").id

level_ids = []
level_ids << Level.create(name: "初級").id
level_ids << Level.create(name: "中級").id
level_ids << Level.create(name: "上級").id

genre_ids = []
genre_ids << Genre.create(name: "Ruby").id
genre_ids << Genre.create(name: "Ruby on Rails").id
genre_ids << Genre.create(name: "Python").id
genre_ids << Genre.create(name: "Django").id
genre_ids << Genre.create(name: "ゲーム").id
genre_ids << Genre.create(name: "仮想通貨").id
genre_ids << Genre.create(name: "Web").id
genre_ids << Genre.create(name: "スマートフォンアプリ").id

course_ids = []
course_table.each do |row|
  teacher_id = Teacher.create { |t|
    t.name = row['teacher_name']
    t.phone_number = "01-2345-6789"
    t.gender_id = gender_ids.sample
  }.id

  course_ids << Course.create { |c|
    c.name = row['course_name']
    c.teacher_id = teacher_id
    c.level_id = level_ids.sample
    c.genre_ids = genre_ids.sample(2)
  }.id
end

subject_table.each do |row|
  plan = Plan.create do |s|
    s.title = row['subject_title']
    s.body = row['subject_body']
    s.course_id = row['course_id']
  end
end

student_ids = []
1.upto(10) do |i|
  obj = Student.new
  obj.name = "生徒 #{i}"
  obj.phone_number = "01-2345-6789"
  obj.gender_id = gender_ids.sample
  obj.save
  student_ids << obj.id
end

course_ids.each do |cid|
  student_ids.sample(5).each do |sid|
    AssignStudent.create(course_id: cid, student_id: sid)
  end
end