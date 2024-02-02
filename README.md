this SQL file Provide to the Analysis some Important Study in Employees Retention Data.
First Step in MYQSL is Importing or Loading Csv file's Succesefully 
first file Load :- load data infile "HR_1.csv" into table hr1 
fields terminated by ','
ignore 1 lines ;
Second File Load :- load data infile "HR_2.csv" into table hr2
fields terminated by ','
ignore 1 lines ;
then Tranforming to the Data's like a which Column and Row's  you need or Sorting the data Proprerly
Writting Following KPI's Querie's in MYSQL workbench 
1) Average Atrrition Rate - Department Wise.
  in this Querie Starting SELECT(Commaend ) and Using CASE then Applying GROUP BY Function.
this KPI showing What is Atrrition Rate in all Department.

2) Average Hourly Rate Male Research Scientist.
   in this Querie Using Avg.function applying WHERE cluase for Condition
   this KPI just Focusing to the Male Research Scientist Avg. Hourly rate.
3) Average Working Years - Department WIse
  Using AVG.function and Also use JOIN function (inner join)
this KPI showing avg. work in year's Employees in  various Department.

4) Job Role Vs Working Life Balance
  in this Querie Use  count,Join(inner Join), Sorting Group by and then Order by
this KPI is showing how Job role Effect Work Life Balance.

5) Atrrition Rate Vs Year Since Last Promotion
   in this Querie Use Avg.,Join, then Sorting Group By
  this KPI Showing what is Effect Atrriton Rate in Employees Promotion's.

6) Atrrition Rate Vs Monthly Income
   in this  Querie Use Avg.,Sum, CASE , Join then Arranging Group by
   this KPI Showing or Explaining About Atrrition Rate Opposite Monthly Income.

   
   
   
   


    
