# Pewlett-Hackard-Analysis
## 1 Overview of The Project
Pewlett-Hackard is a large company and has been around for a long time. The purpose of this analysis is to prepare Pewlett-Hackard for the upcoming large number of retirements.  As many of their employees will be retired, they want to know how many employees will be retiring, open positions and employee’s training to fill up the positions.

The following tasks will be performed in this analysis:
  1.	Create a retirement titles table and export into csv, the data consists of employee no, first name, last name, titles, from date and to date of employees that will be    retiring. 
  2.	Create a unique titles table from retirement tables and export into csv, the data consists of employee no, first name, last name, titles of employees that will be retiring   with their last titles.
  3.	Create a retiring titles table and export into csv, the data consists of titles and count of employees that will be retiring group by their titles.
  4.	Create a mentorship eligibility table and export into csv for current employees who were born between January 1,1965 and December 31,1965.

## 2 Resources
Data Source: titles.csv, salaries.csv, employees.csv, dept_manager.csv, dept_emp.csv, departments.csv

Software: pgAdmin 4, SQL, Quick DBD

## 3 ERD
The Entity Relationship Diagram (ERD) shows in Figure 1 describe the relationship of entity sets stored in databases for Pewlett-Hackard employees.  For this analysis the ERD build in Quick DBD and consists of 6 tables which are titles, salaries, employees, dept_manager, dept_emp and departments. The data is exported from 6 csv that Pewlett-Hackard used previously to store the data. 

<p align="center">
  
  ![EmployeeDB](https://user-images.githubusercontent.com/88597187/136645057-53c614dd-47c5-48c1-8043-c8f8b783cf6c.png)
  
  <sub> Figure 1 Pewlett-Hackard Employees  ERD </sub>
</p>

