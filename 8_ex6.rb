def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an emprty array
  students = []
  #get first name
  name = $stdin.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = $stdin.gets.chomp
  end

  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
end

end
#finally, we print the total number of students
def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(20, " ")
end
#nothing happens until we call the methods


students = input_students
print_header
print(students)
print_footer(students)
