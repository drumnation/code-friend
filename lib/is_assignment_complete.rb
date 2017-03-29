require '/Users/davidmieloch/dev/learn-live-love/config/environment'

all_students_in_class = []

# get array of all students that submitted a pull request for X lab


def who_pulled?(lab_id)
  sql = <<-SQL
        SELECT student.github_username
        FROM pulls
        ON student_id = labs.lab_id
        SQL
end
