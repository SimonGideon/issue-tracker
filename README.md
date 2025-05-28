# Issue Tracker

Ruby on Rails application for tracking project issues with visual reporting.

## Screenshots
![chart-page](https://github.com/user-attachments/assets/6efa1ef2-cfad-49f7-b2f9-592ec62b7e02)
![image](https://github.com/user-attachments/assets/df8633ad-6e52-426d-a6d4-97584193cfee)
![pdf report](https://github.com/user-attachments/assets/e92d64e9-685b-4909-a536-1b09f5e54aff)

## Deployed Version 🌐
[Click Me ](https://issue-tracker-6jbo.onrender.com/projects)



## Features

- **Projects**: Create, edit, and delete projects
- **Issues**: CRUD operations with status (New/In Progress/Closed) and priority (1-5)
- **Charts**: Issues by status (pie chart) and by project (column chart)

## Tech Stack

- Ruby 3.2.2
- Rails 7.0.8.7
- PostgreSQL
- Chartkick + Chart.js

## Quick Start

```bash
git clone https://github.com/yourusername/issue-tracker.git
cd issue-tracker
bundle install
rails db:create db:migrate db:seed
rails server
```

Visit `http://localhost:3000`
