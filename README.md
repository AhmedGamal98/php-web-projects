# PHP Web Projects

> 15 full-stack web applications built with PHP and MySQL between 2021 and 2022. Each one is a complete system with role-based dashboards, CRUD features and a relational database. Several have Arabic (RTL) interfaces.

![PHP](https://img.shields.io/badge/PHP-777BB4?logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black)
![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3?logo=bootstrap&logoColor=white)
![License: MIT](https://img.shields.io/badge/License-MIT-green)

## Projects

| Project | What it does | Roles |
| --- | --- | --- |
| [Medical-Records](Medical-Records) | Smart medical records: appointments, check-ups with lab and radiology results, prescriptions | Admin, doctor, receptionist, lab technician, ministry |
| [my_doctor](my_doctor) | Doctor booking: hospitals, doctors and services, patient appointments and ratings | Admin, doctor, patient |
| [Investments](Investments) | Startup investment platform: creators post ideas, and investors get ideas recommended by their interests, then send requests and messages | Admin, creator, investor |
| [Mohaseby](Mohaseby) | Accounting and inventory system (Arabic): sales, returns, purchases, warehouses, products, profit-and-loss reports | Admin, accountant |
| [Schools](Schools) | School management: classes, courses, lessons, timetables, attendance, grades and messaging | Admin, teacher, student, parent |
| [Education](Education) | Online lessons platform (Arabic): subjects, classes, lessons, exams and results | Admin, teacher, student |
| [itrack](itrack) | Learning-tracks platform: tracks and units, problem reports, chat, announcements and notifications | Admin, student |
| [Driving](Driving) | Driving-school platform: trainer approval and assessment, training schedules, enrolment and payments | Admin, trainer, trainee |
| [Transportation](Transportation) | University transport: companies offer packages, students book and pay, with drivers and notifications | Admin, company, student |
| [al-ahsa-heritage](al-ahsa-heritage) | Farm-tourism marketplace: farmers list products and activities, customers shop and book visits | Admin, farmer, customer |
| [Alber_Charities](Alber_Charities) | Charity platform: cases in need, events, food baskets, donation requests and payments | Admin, user |
| [fasela](fasela) | Planting advisory (Arabic): users pick a location, see suitable plants and ask advisors for consultations | Admin, advisor, user |
| [IT](IT) | IT help-desk ticket system: employees open tickets, IT staff respond, and the service is rated | Employee, IT, trainee |
| [custody_management](custody_management) | Company custody (asset) management: items assigned to users, requests, posts and comments | Admin, user |
| [Najah](Najah) | Business-success predictor: answer a questionnaire and get the estimated success rate of a new business | User |

## Run a project locally

1. Install [XAMPP](https://www.apachefriends.org/) (Apache, PHP and MySQL).
2. Copy the project folder into `C:\xampp\htdocs\`.
3. In phpMyAdmin, create a database and import the project's `.sql` file.
4. Check the database settings in the project's connection file (for example `connect.php` or `include/connection.php`).
5. Open `http://localhost/<project-folder>/`.

## Notes

- **Database files are cleaned copies.** Personal data (users, contacts, messages, payments and medical data) was removed before publishing, and the table structure is kept. Add your own admin row to log in.
- **Google Maps:** pages with maps use the placeholder `YOUR_GOOGLE_MAPS_API_KEY`. Replace it with your own key.
- These are earlier projects (2021–2022) and are kept here as a portfolio of complete, working systems.

## Author

**Ahmed Gamal Saber**, Full-Stack Web Developer & AI Engineer
[LinkedIn](https://linkedin.com/in/ahmed-gamal-saber-382081169) · [GitHub](https://github.com/AhmedGamal98)
