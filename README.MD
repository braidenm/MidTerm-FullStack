## MIDTERM GROUP PROJECT

Created by:
Jimmy Fruchterman - Scrum Master
Mike Murrell - Git Repo Owner
Braiden Miller - DBA

Link to project on AWS: link

## Description

We built a website called "VolunteerUp". This website lets you plan or join
projects to improve your community, whether it's cleaning up a dirty walking
path, landscaping a park, fixing potholes, it's up to you!

This website allows you to register, create a profile, login/logout, join or
leave projects, create projects, comment on them, and if you have permission,
edit or delete projects, comments, and volunteers. We also have an admin role
that allows you special permissions to edit projects or volunteers on the site.
The website also allows you to track the hours volunteers have pledged and
contributed to the project, and also tools and skills needed by the project and
provided by volunteers.

## How to use



## Requirements

Our website was created to satisfy the following requirements of our midterm
project:

- A fully developed database schema. The database must be connected to your Java code using JPA.
- Our friend C.R.U.D, this time manipulating objects and saving them in an appropriate database table.
- A user log in, which is authenticated by a mySQL table. There should be different permission levels for the users, one admin that can add/update/delete content present on the site.
- A correct implementation of a session object, this can be used to track a logged in user and any changes they make (for example, a shopping cart or favorites list).
- A way to track an individual user's previous experiences on the site. For example if it is a food ordering system, a list of previous orders.

## Technology Used

SpringMVC with SpringBoot, MySQL, CRUD, HTML, CSS, JSP, Bootstrap, AWS.

## Stretch goals

Accomplished:
- See other user's profiles
- Comments on projects (add, remove)
- Project has location map (google maps API)
- User can associate with a company
- Can cancel project, see if it was cancelled

Ran out of time:
- Hashcoded password
- User can filter projects by date
- User reputation tracker (actual hours vs. pledged, etc.)
- Map on homepage showing pins for various projects
- Project recommendations based on skills, past project interest
