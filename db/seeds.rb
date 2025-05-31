if Rails.env.development? || Rails.env.staging?
    Issue.destroy_all
    Project.destroy_all
  end

# Create diverse projects
projects_data = [
  {
    title: "E-commerce Platform",
    description: "Building a modern e-commerce platform with Rails and React, featuring real-time inventory and advanced search capabilities"
  },
  {
    title: "Mobile App Backend",
    description: "API backend for mobile application with real-time features and offline support"
  },
  {
    title: "Data Analytics Dashboard",
    description: "Real-time analytics dashboard for business intelligence with custom reporting"
  },
  {
    title: "Content Management System",
    description: "Enterprise-grade CMS with multi-tenant support and advanced workflow management"
  },
  {
    title: "IoT Device Management",
    description: "Platform for managing and monitoring IoT devices with real-time data processing"
  },
  {
    title: "Customer Support Portal",
    description: "Integrated customer support system with ticket management and knowledge base"
  }
]

projects = projects_data.map do |project_attrs|
  Project.find_or_create_by(title: project_attrs[:title]) do |p|
    p.description = project_attrs[:description]
  end
end

unless Issue.exists?
  issues_data = [
    {
      title: "Fix payment gateway integration bug",
      status: "In Progress",
      priority: 5,
      project: projects[0]
    },
    {
      title: "Implement product search with filters",
      status: "New",
      priority: 4,
      project: projects[0]
    },
    {
      title: "Add shopping cart persistence",
      status: "Closed",
      priority: 3,
      project: projects[0]
    },
    {
      title: "Optimize product image loading",
      status: "In Progress",
      priority: 2,
      project: projects[0]
    },
    {
      title: "Implement push notification system",
      status: "New",
      priority: 4,
      project: projects[1]
    },
    {
      title: "Add offline data synchronization",
      status: "In Progress",
      priority: 5,
      project: projects[1]
    },
    {
      title: "Fix API rate limiting",
      status: "Closed",
      priority: 3,
      project: projects[1]
    },
    {
      title: "Implement custom report builder",
      status: "New",
      priority: 4,
      project: projects[2]
    },
    {
      title: "Add data export functionality",
      status: "In Progress",
      priority: 3,
      project: projects[2]
    },
    {
      title: "Fix chart rendering performance",
      status: "Closed",
      priority: 2,
      project: projects[2]
    },
    {
      title: "Implement role-based access control",
      status: "New",
      priority: 5,
      project: projects[3]
    },
    {
      title: "Add content versioning",
      status: "In Progress",
      priority: 4,
      project: projects[3]
    },
    {
      title: "Fix media upload issues",
      status: "Closed",
      priority: 3,
      project: projects[3]
    },
    {
      title: "Implement device provisioning",
      status: "New",
      priority: 5,
      project: projects[4]
    },
    {
      title: "Add real-time device monitoring",
      status: "In Progress",
      priority: 4,
      project: projects[4]
    },
    {
      title: "Fix data aggregation pipeline",
      status: "Closed",
      priority: 3,
      project: projects[4]
    },
    {
      title: "Implement ticket assignment system",
      status: "New",
      priority: 4,
      project: projects[5]
    },
    {
      title: "Add customer feedback system",
      status: "In Progress",
      priority: 3,
      project: projects[5]
    },
    {
      title: "Fix email notification system",
      status: "Closed",
      priority: 2,
      project: projects[5]
    }
  ]

  issues_data.each do |issue_attrs|
    Issue.create!(issue_attrs)
  end
end

puts "Created #{Project.count} projects and #{Issue.count} issues"