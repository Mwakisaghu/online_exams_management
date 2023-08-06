# online_exams_management
A sample online exams database platform for conducting exams in a school setting. It allows both teachers and students to perform tasks such as creating exams, allowing students to take exams and also help in grading them while indicating the score.

## Database designs and diagrams
Database diagrams for this project have been designed with [dbdiagram.io] You can view the diagram here (https://dbdiagram.io/d/64ca939002bd1c4a5e2326a6)

## Tasks
- Design and implement an online exams database 
- Display all exams set by the teacher

  To display all exams set by a teacher. We will refer to the **exams table** and **created_by_id column**. The created_by_id column references the **teachers 
  id** in the **teachers table**
  
  ![Screenshot from 2023-08-07 00-57-42](https://github.com/Mwakisaghu/online_exams_management/assets/77724757/4a3f5bd0-c302-46ef-a41b-3f895526096f)

  To display all exams set by a teacher and the questions included, we can use JOIN to combine both the exams table and the questions table while using 
  created_by_id with WHERE clause for filtering purposes.

  ![Screenshot from 2023-08-07 01-11-25](https://github.com/Mwakisaghu/online_exams_management/assets/77724757/65263815-4dee-41c7-9d42-1ee58c1eeaa7)



  
- Generate a report on the answers provided by a pupil for an exam and their percentage score.
  
- Generate a report on the top 5 pupils with the highest scores in a certain exam.

  ![Screenshot from 2023-08-07 01-54-48](https://github.com/Mwakisaghu/online_exams_management/assets/77724757/d037fd57-6f4d-4d8e-bc88-a216f7f0df80)


  We will use the select query to generate a report of students with their attributes i.e. students' names, surnames and total scores. The students' id is used as a foreign key in the score_card table to retrieve the students' scores and are generated in a descending order hence **DESC.**

  Use **LIMIT 5** clause just after ORDER BY to limit to only 5 students.


  
- Generate a report sheet of the scores for all pupils in each of the exams and rank them from the highest average score to the lowest.

  ![Screenshot from 2023-08-07 02-05-18](https://github.com/Mwakisaghu/online_exams_management/assets/77724757/2c5d716b-3593-4d70-8653-dc40b66d7a2f)


## Contributions
Contributions from the community are welcomed! Please follow the contribution guidelines. For any additions/deletions please **open an issue** in the repository.

