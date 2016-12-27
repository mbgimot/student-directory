def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an emprty array
  students = []
  cohorts = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  #get first name
  name = $stdin.gets.chomp
  #while the name is not empty, repeat this code
  puts "Please enter the student's cohort"
  cohort = $stdin.gets.chomp
  if cohort.empty?
    cohorts = :november
  else
    cohorts = cohort.downcase.to_sym
  end

  while !name.empty? && !cohorts.empty? do
    #add the student hash to the array
    students << {name: name, cohort: cohorts}
    puts "Now we have #{students.count} students"
    puts "New name please"
    name = $stdin.gets.chomp
    puts "their cohort?"
    cohort = $stdin.gets.chomp
    if cohort.empty?
      cohorts = :november
    else
      cohorts = cohort.downcase.to_sym
    end
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
  puts "Overall, we have #{students.count} great students"
end
#nothing happens until we call the methods


def print_cohort(students, cohorts)
  array = []
  students.map do |student|
    if student[:cohort] == cohorts
      array << student[:name]
end
end
puts array
end



students = input_students
print_header
#print(students)
  puts "Would you like to group students by a particular cohort?"
  cohort = $stdin.gets.chomp
  if cohort.empty? || cohort === "no"
    print(students)
    else
    cohorts = cohort.downcase.to_sym
    print_cohort(students, cohorts)
  end
print_footer(students)
