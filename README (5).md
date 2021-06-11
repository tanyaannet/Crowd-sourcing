![BFH Banner](https://trello-attachments.s3.amazonaws.com/542e9c6316504d5797afbfb9/542e9c6316504d5797afbfc1/39dee8d993841943b5723510ce663233/Frame_19.png)
# EVENTO- EVENT PORTAL
THIS PROJECT ALLOWS ADMIN TO HOST A EVENT AND USERS TO CREATE A PROFILE,VIEW EVENTS AND REGISTER FOR THEM.

## LIVE LINK TO THE PORTAL
   https://event-web-portal.herokuapp.com/
## Link to product walkthrough
[ https://www.loom.com/share/7adfd0ec3f424d4bbab255e5f6da02df]
## How it Works ?
1. deploy the domain
2. register a profile as user or login as admin
3.  A-admin P-12345
4. in user profile events can be viewed and registered accordingly
5. in admin profile event can be created and can list the partcipants registered for the event 
## Libraries used
certifi==2020.12.5
chardet==4.0.0
click==8.0.1
colorama==0.4.4
coverage==5.5
docopt==0.6.2
Flask==2.0.0
gunicorn==20.1.0
idna==2.10
itsdangerous==2.0.1
Jinja2==3.0.1
MarkupSafe==2.0.1
pipreqs==0.4.10
PyMySQL==1.0.2
requests==2.25.1
urllib3==1.26.5
Werkzeug==2.0.1
yarg==0.1.9
## Package Desciption
main:Contains the main routes
static:Contains the css and javascript file along with some images
templates:Contains the html pages
Event.sql:Module containing forms and routes of events
## How to configure
Use the event.py file in the  directory to configure the web app.
Installation by cloning the repository
git clone https://github.com/tanyaannet/Crowd-sourcing
add the directories accordingly in pycharm sqplyog
## How to Run
1. start with the wampserver
2. run the sqylyog to open the database
3. open pycharm and import the file event.py and run 
4. your web app is open to view the website 
