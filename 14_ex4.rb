@students = []
def input_students
  name = STDIN.gets.chomp
  while !name.empty? do
    add_student(name, :november)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def input_students_instruct
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
end


def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
@students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
end

end
#finally, we print the total number of students
def print_footer
  puts "Overall, we have #{@students.count} great students"
end
#nothing happens until we call the methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students_instruct
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
    puts "#{@students.count} students were saved to students.csv"
  when "4"
    load_students
    puts "#{@students.count} students were loaded from students.csv"
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end


try_load_students
interactive_menu
