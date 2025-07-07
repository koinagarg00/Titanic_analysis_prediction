use project3;
select * from `cln_titanic`;

-- Find the count of pasenger
Select count(passengerid) from `cln_titanic`;

-- Find the male or female passengers
select count(sex ) as count_of_gender from `cln_titanic` group by sex ;

-- What is the average age of a person
select avg(age) from `cln_titanic`;

-- Survival rate
select survived,count(survived) from `cln_titanic` group by survived;

-- Create the family size using Parch, SibSp And find the survival rate by family size
with family_sze as (select passengerid,Survived,(parch+sibsp+1) as family_size from `cln_titanic`) 
select family_size ,survived,count(*) count_family_size from family_sze group by family_size,survived order by family_size desc;

-- Create a fare level 
with fare_lvl as (select fare ,passengerid,survived, case when fare<25 then "Low" when fare>=25 and fare<60 then "Medium"
 when fare>=60 and fare<100 then "Mid_range" else "High" end as fare_level from `cln_titanic`)
 select fare_level,count(survived)as count_survival_rate ,survived from fare_lvl group by fare_level,survived order by count_survival_rate desc;
 
 -- Create age group 
 with age_grp as (select age, passengerid, survived , case when age<15 then "Child" when age>=15 and age<30 then "Teenager" 
 when age>=30 and age<45 then "Adult" else "Oldage" end as age_group from `cln_titanic` )
 select age_group, survived , count(survived) as count_survival_rate from age_grp group by age_group, survived order by count_survival_rate; 
 
 -- Create a column as ISALONE if SibSp+parch=o then 1 (alone) else 0 (no alone)
with is_alone as (select passengerid,parch,sibsp,survived,case when (Sibsp+parch)=0 then "Yes" else "No" end as ISAlone from `cln_titanic`)
select ISAlone,survived,count(survived) count_survival_rate from is_alone group by isalone,survived order by count_survival_rate desc;

-- count survival rate by embarked place
select embarked, survived, count(survived) as count_survival_rate from `cln_titanic` group by embarked,survived;

-- Classify passengers it high class, middle class or lower class using pclass
with p_class as (select passengerid, pclass, survived,case when pclass=1 then "UpperClass" when pclass=2 then "MiddleClass" else "LowerClass" end as p_cls from `cln_titanic`)
select p_cls, survived,count(survived) as count_survival_rate from p_class group by p_cls,survived;

-- Find the passengers who paid more than the average
select fare ,passengerid from `cln_titanic` where fare >(select avg(fare) from `cln_titanic`);

-- Find the survival rate by Pclass or sex
select pclass,sex,survived,count(survived) from `cln_titanic` group by pclass,sex,survived order by pclass;

-- Show the surival rate by sex across different pclass levels(columns)
select sex, round(avg(case when pclass=1 then survived end)*100,2) as class1_survival_rate,
round(avg(case when pclass=2 then survived end)*100,2) as class2_survival_rate,round(avg(case when pclass=3 then survived end)*100,2) as class3_survival_rate from 
`cln_titanic` group by sex;

-- Show a matrix : pclass (rows)*Age group(columns) showing average survival rate
with age_grp as (select age, pclass,passengerid, survived , case when age<15 then "Child" when age>=15 and age<30 then "Teenager" 
 when age>=30 and age<45 then "Adult" else "Oldage" end as age_group from `cln_titanic` )
 select pclass,round(avg(case when age_group="Child" then survived end)*100,2) as Child,round(avg(case when age_group="Teenager" then survived end)*100,2) as Teenager,
 round(avg(case when age_group="Adult" then survived end)*100,2) as Adult,round(avg(case when age_group="Oldage" then survived end)*100,2) 
 as Oldage from age_grp group by pclass order by pclass;
 
 -- Rank passenger by fare with each class
 with fare_lv as (select passengerid,pclass,fare,dense_rank()over(partition by pclass order by fare desc) as fare_rank from `cln_titanic`)
 select * from fare_lv where fare_rank<=3 order by pclass,fare_rank;
 
 --  Find out the cumulative fare
 select * ,sum(fare) over (partition  by pclass order by fare) as cumulative_sum from `cln_titanic`;
 
 -- Passenger had a higher fare than the avgerage from their embarkation port
 with avg_fare as (select embarked, round(avg(fare),2) as embarked_avg_fare from `cln_titanic` group by embarked)
 select c.passengerid,c.fare,c.pclass, c.embarked from `cln_titanic` c join avg_fare a on c.fare>a.embarked_avg_fare;
 
 -- Passengers who had the same fare or same class at one
 select * from `cln_titanic` where (pclass,fare) in (select pclass,fare from `cln_titanic` group by pclass,fare having count(*)>1);
 
 -- passengers whose age is greater than the avg age in their class or survived
  with avg_age as (select survived,embarked, round(avg(age),2) as embarked_avg_age from `cln_titanic` group by embarked,survived)
  select c.survived,c.passengerid,c.fare,c.pclass, c.age,c.embarked from `cln_titanic` c join avg_age a on c.age>a.embarked_avg_age;
 
 -- For each class get the passenger with min or max age
 select pclass, min(age) as min_age,max(age) as max_age ,round(avg(age),2) as avg_age from `cln_titanic` group by pclass order by pclass;
 
 
 
 
 
 
 
 
 
 
 
 









