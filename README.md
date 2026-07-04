Requirement
A Health Care insurance company is facing challenges in enhancing its revenue and understanding the customers so it wants to take help from Big Data Ecosystem to analyse the Competitors company data received from varieties of sources, namely through scrapping and third-party sources. This analysis will help them to track the behaviour, condition of customers so that they can customise offers for them to buy insurance policies and also calculate royalties to those customers who buy policies in the past, this in turn will enhance their revenues.

List Of requirements
●	Which disease has a maximum number of claims.
●	Find those Subscribers having age less than 30 and they subscribe any subgroup
●	Find out which group has maximum subgroups.
●	Find out hospital which serve most number of patients
●	Find out which subgroups subscribe most number of times
●	Find out total number of claims which were rejected
●	From where most claims are coming (city)
●	Which groups of policies subscriber subscribe mostly Government or private
●	Average monthly premium subscriber pay to insurance company.
●	Find out Which group is most profitable
●	List all the patients below age of 18 who admit for cancer
●	List patients who have cashless insurance and have total charges greater than or equal for Rs. 50,000.
●	List female patients over the age of 40 that have undergone knee surgery in the past year

The goal of the project
The goal of the project is to create data pipelines for the Health Care insurance company which will make the company make appropriate business strategies to enhance their revenue by analysing customers behaviours and send offers and royalties to customers respectively.

Environment
●	AWS S3
●	AWS Redshift
●	Databricks
●	AWS EMR Studio
●	Pyspark
●	Jira
●	GitHub

●	DATASET CREATION
○	Upload the given sample data on AWS s3 in a folder named input-data.
●	DATA CLEANING
○	Data cleaning is the process of fixing or removing incorrect, corrupted, incorrectly formatted, duplicate, or incomplete data within a dataset. When combining multiple data sources, there are many opportunities for data to be duplicated or mislabeled. If data is incorrect, outcomes and algorithms are unreliable, even though they may look correct. There is no one absolute way to prescribe the exact steps in the data cleaning process because the processes will vary from dataset to dataset.
○	Cleaning Activity
■	First check if there are null values in dataset
■	Count the total Null values for each column
■	And then replace the null values for specific columns by NA 
■	Check the If three are duplicates records
■	If there are duplicates then drop duplicates
■	
○	 Clean data for at least for following datasets
■	 Patients
■	Subscriber
■	Claims
■	Group_subgroup
○	
○	Upload cleaned data corresponding to each data set into a redshift table.
○	Please create a schema design doc for target tables.
●	RESULT CREATION ON REDSHIFT
○	Create a separate redshift table for each use case output in a redshift schema
■	Schema = Project-Output


Note-
●	For implementation and testing purposes you can use Databricks community edition.
●	When your code is ready to use you can push this code to the github repo with the help of pycharm.
●	At the end this code will be deployed on AWS EMR or Databricks with the help of Github.

Submission - You are supposed to submit followings in  github repos
●	Documents Repo
○	Requirement specification documents
○	Solution Design Documents
○	Create documents for followings
■	Create a 2 week sprint for this project in jira.
■	First week for documentations and solution design.
■	Second week for implementation and testing.
■	List of jira user stories and tasks which you have created for individual use cases in a scrum type project.
■	List of jira user stories and tasks created for test cases Or a single test cases xls sheet.
○	A database schema design doc for final redshift tables with primary and foreign key combinations.
●	Pyspark Source Code Repo - This should include following
○	Data cleansing modules
○	Result generations modules
●	You are supposed to present your solution to an available audience with a live class presentation  with use cases explanation and solution design with required screen-shots.
○	Recommendation 
■	You can include databricks visualisations for results snapshots.


Template - Requirements Specifications Document
1.	 Introduction - This introduction is very important as it sets expectations that we will come back to throughout the SRS.
a.	Purpose -Define the purpose of these requirements here.
b.	Intended Audience and Use - Define who in your organization will have access to the SRS and how they should use it. This may include developers, testers, and project managers.
c.	Product Scope - What are the benefits, objectives, and goals we intend to have for this product? This should relate to overall business goals, especially if teams outside of development will have access to the SRS.
d.	Definitions and Acronyms -Clearly define all key terms, acronyms, and abbreviations used in the SRS. This will help eliminate any ambiguity and ensure that all parties can easily understand the document.
2.	Overall Description - Your next step is to give a description of what you’re going to build. Why is this product needed? Who is it for? Is it a new product? Is it an add-on to a product you’ve already created? Is this going to integrate with another product? Understanding and getting your team aligned on the answers to these questions on the front end makes creating the product much easier and more efficient for everyone involved.
a.	 User Needs - Describe who will use the product and how. Understanding the various users of the product and their needs is a critical part of the SRS writing process.
b.	 Assumptions and Dependencies - What are we assuming will be true? Understating and laying out these assumptions ahead of time will help with headaches later. Are we assuming current technology? Are we basing this on a Windows framework?  We need to take stock of these technical assumptions to better understand where our product might fail or not operate perfectly.
3.	System Features and Requirements -In order for your development team to meet the requirements properly, we must include as much detail as possible. This can feel overwhelming but becomes easier as you break down your requirements into categories.
a.	Functional Requirements - Functional requirements are essential to your product because, as the name implies, they provide some sort of functionality. Asking yourself questions such as “does this add to my tool’s functionality?” or “what function does this provide?” can help with this process. You may also have requirements that outline how your software will interact with other tools
b.	External Interface Requirements - You may also have requirements that outline how your software will interact with other tools There are several types of interfaces you may have requirements for, including:
i.	User
ii.	Hardware
iii.	Software
iv.	Communications
c.	System Features - System features are a type of functional requirements. These are features that are required in order for a system to function.
d.	Nonfunctional Requirements - Nonfunctional requirements, which help ensure that a product will work the way users and other stakeholders expect it to, can be just as important as functional ones. These may include:
i.	Performance requirements
ii.	Safety requirements
iii.	Security requirements
iv.	Usability requirements
v.	Scalability requirements


Template-Solution Design Document
1.	Solution - Explain your solution here in a step by step manner.
2.	Use Cases - List down all the use cases on which this solution will be applicable.
3.	Database Design - List down all possible db(Redshift) tables here
a.	 Tables Metadata Info with Pk/FK relationship - 
b.	 ER diagram - Optional
4.	Technologies and Platforms to be used in this solution -List down list of technologies like spark, aws and databricks etc.




