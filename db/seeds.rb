if Rails.env.development? || Rails.env.staging?
    Issue.destroy_all
    Project.destroy_all
  end

  project1 = Project.find_or_create_by(title: "E-commerce Platform") do |p|
    p.description = "Building a modern e-commerce platform with Rails and React"
  end
  
  project2 = Project.find_or_create_by(title: "Mobile App Backend") do |p|
    p.description = "API backend for mobile application"
  end
  
  project3 = Project.find_or_create_by(title: "Data Analytics Dashboard") do |p|
    p.description = "Real-time analytics dashboard for business intelligence"
  end
  
  unless Issue.exists?
    issues_data = [
      {
        title: "Fix user authentication bug",
        status: "In Progress",
        priority: 4,
        project: project1
      },
      {
        title: "Add payment integration",
        status: "New",
        priority: 5,
        project: project1
      },
      {
        title: "Optimize database queries",
        status: "Closed",
        priority: 3,
        project: project1
      },
      {
        title: "Implement push notifications",
        status: "New",
        priority: 3,
        project: project2
      },
      {
        title: "Add user profile endpoints",
        status: "In Progress",
        priority: 2,
        project: project2
      },
      {
        title: "Setup data visualization charts",
        status: "New",
        priority: 4,
        project: project3
      },
      {
        title: "Implement real-time updates",
        status: "In Progress",
        priority: 5,
        project: project3
      }
    ]
  
    issues_data.each do |issue_attrs|
      Issue.create!(issue_attrs)
    end
  end
  
  puts "Created #{Project.count} projects and #{Issue.count} issues"