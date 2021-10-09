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
    <img src="https://user-images.githubusercontent.com/88597187/136645057-53c614dd-47c5-48c1-8043-c8f8b783cf6c.png"/>
  </p>
  
<p align="center">  
  <sub> Figure 1 Pewlett-Hackard Employees  ERD </sub>
</p>

## 4 Results 
1.	List of Retiring Employees
    
    The list of retiring of employees is saved on retirement_titles table  and [retirement_titles.csv]("https://github.com/nayowl/Pewlett-Hackard-Analysis/blob/main/Data/retirement_titles.csv") as shown in Figure 2. Below is the information that can be retrieved from the table:

      * It consists of employee number, first name, last name, titles, from date and to date order by the employee number
      * This list shows employees which birth date between 01 January 1952 and 31 December 1955. 
      * It has 133,776 rows data
      * Some of the employee appears more than one because they have more than one titles through their employment in Pewlett-Hackard. For example, employee no 10009, he was         an assistant engineer from 1985-1990, an engineer from 1990-1995 and became senior engineer from 1995 until now.

<p align="center">
<img src="https://user-images.githubusercontent.com/88597187/136645240-0e562950-b6e8-4d88-ae78-978cd7adfc97.png"/>
</p>
<p align="center">
  <sub> Figure 2 List of Retiring Employees </sub>
</p>

2.	List of Retiring Employees with Last Titles

    The list of retiring of employees with their last titles is saved on unique_titles table  and [unique_titles.csv]("https://github.com/nayowl/Pewlett-Hackard-Analysis/blob/main/Data/unique_titles.csv") as shown in Figure 3. Below is the information that can be retrieved from the    table:
    * It consists of employee number, first name, last name, and their last titles order by the employee number
    * It has 90,398 rows data. 
    * Each employee only appears one with their last titles. Because there is no more data duplication, this list can be used as reference to know information about employee that will be retire in next few years. 

<p align="center">
    <img src="https://user-images.githubusercontent.com/88597187/136645304-eed43ceb-6df4-4093-a386-80b657247a21.png"/>
</p>
<p align="center">
  <sub> Figure 3 List of Retiring Employees with Last Titles  </sub>
</p>

3.	Number of retiring employees group by titles

    Table retiring_titles and [retiring_titles.csv]("https://github.com/nayowl/Pewlett-Hackard-Analysis/blob/main/Data/retiring_titles.csv") as shown in Figure 4 contains number of retiring employees group by titles. Below is the information that can be retrieved from the table:
    * It consists of number of the employees and titles
    * It has 7 rows of data.
    * The largest number of employees that will be retiring are Senior Engineer with 29,414 people  , Meanwhile  only 2 Manager will be retiring for the next few years. 

<p align="center">
    <img src="https://user-images.githubusercontent.com/88597187/136645441-49c8c39a-2430-4a31-a37e-389b7518cfe6.png"/>
</p>
<p align="center">
  <sub> Figure 4 Number of Retiring Employees Group by Titles  </sub>
</p>

4.	Mentorship Eligibility

    The list of employees who are eligible for mentorship is saved on mentorship_eligibilty table and [mentorship_eligibilty.csv]("https://github.com/nayowl/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibilty.csv"). Below is the information that can be retrieved from the table:
    * It consists of employee number, last name, birth date, from date, to date and titles of employees who were born between January 1, 1965 and December 31, 1965.
    * It has 1549 rows of data
  
<p align="center">
    <img src="https://user-images.githubusercontent.com/88597187/136645481-1902e5db-40b4-4e28-b7e3-522f3abda875.png"/>
</p>
<p align="center">
  <sub>Figure 5 List of Employees with Mentorship Eligibility  </sub>
</p>

## 5 Summary
1. Roles to be Filled
    
Based on the list of retiring employees with last titles, there will be 90,398 employees that will be retiring with 72,548 employees active and 17,940 inactive. To know  the employees still active, the list of retiring employees will be joined to table dept_emp where to_date=”9999-01-01”. With total 240,124 employees that still working in Pewlett_Hackard until now, that means around 30.21% employees of Pewlett_Hackard will be retired in next few years. To better analyze how many roles to be filled, additional queries will be executed.
    
The first one will be the roles to be filled per department and titles. Using the existing list of retiring employees, this list will be joined to table dept_emp to know the last department us DISTINCT ON. After the new list retrieved, this list will be filtered to show only the active employee and group by the department and titles. Figure 6 show the list of roles to be filled group by department and titles. The data will be saved to Active_retired_employee table and [Active_retired_employee_perDeptTitles.csv]("https://github.com/nayowl/Pewlett-Hackard-Analysis/blob/main/Data/Active_retired_employee_perDeptTitles.csv").

<p align="center">
    <img src="https://user-images.githubusercontent.com/88597187/136645570-ebe0b5dd-c887-4992-afe1-7cfa320a255a.png"/>
</p>
<p align="center">
  <sub>Figure 6 List of Roles to be Filled by Departments and Titles  </sub>
</p>
   
The second will be the roles to be filled by year retire, department and titles. The year retire is based on employees birth date year. For example, If the birth year is 1952 the value of year retire will be 1, means that the employee will retire in next year, if the birth year is 1953 the value will be 2 , means that the employee will retire in next 2 year. With this list, Pewlett-Hackard can be focused on prepare to fill the urgent role for employee that will retire in the next year and will have more time to filled the other role. Figure 7 show the list of Roles to be Filled by Year retire, departments, and titles. The data will be saved to Active_retired_employee_byyear and [Active_retired_employee_byyear.csv]("https://github.com/nayowl/Pewlett-Hackard-Analysis/blob/main/Data/Active_retired_employee_byyear.csv").
   
<p align="center">
    <img src="https://user-images.githubusercontent.com/88597187/136645603-e41dded6-5399-42ec-b945-fa19886facea.png"/>
</p>
<p align="center">
  <sub>Figure 7 List of Roles to be Filled by Year Retired,Departments and Titles  </sub>
</p>


2. Qualified Employees 

Based on the list of mentorship eligibility there are 1549 employees who are eligible. To know how many employees in the list group by their department and titles, additional queries added. By knowing how many qualified employees per department, every department can figure strategy to mentor new generation in their department. Figure 8 shows us the list of mentorship eligibility group by departments and titles. The data will be saved on mentorship_eligibility_dept_titles table and [mentorship_eligibility_dept_titles.csv]("https://github.com/nayowl/Pewlett-Hackard-Analysis/blob/main/Data/mentorship_eligibility_dept_titles.csv")

   
<p align="center">
    <img src="https://user-images.githubusercontent.com/88597187/136645644-39a50e35-6fc8-4829-9e6b-971f7f9364cb.png"/>
</p>
<p align="center">
  <sub>Figure 8 List of Mentorship Eligibility Group by Department and Titles  </sub>
</p>

Pewlett-Hackard has 166,027 next generation employees to be trained. With only 1549 mentor that will train them, Pewlett-Hackard will need to think how to train the next generation more efficient and effective with only limited resources and if needed they need to hire new talent to train and develop skills required to fill the position.

<details>
           <summary>Count Next Generation Employees</summary>
           <p>Total active employee (240,124)– active employee that will be retiring(72,548) – Qualified employee (1549)= 166,027</p>
</details>

:heavy_exclamation_mark: *Additional queries for this summary can be find on this [Link](https://github.com/nayowl/Pewlett-Hackard-Analysis/blob/main/Queries/Additional_Queries.sql "Additional queries")*
