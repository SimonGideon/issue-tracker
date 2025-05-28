class ReportsController < ApplicationController
    def index
      @issues_by_status = Issue.group(:status).count
      @issues_by_project = Issue.joins(:project).group('projects.title').count
      @recent_issues = Issue.includes(:project).recent.limit(10)
    end
  
    def export_excel
      @issues = Issue.includes(:project).all
  
      respond_to do |format|
        format.xlsx {
          response.headers['Content-Disposition'] = 'attachment; filename="issues_report.xlsx"'
        }
      end
    end
  
    def export_pdf
      @issues = Issue.includes(:project).all
      @issues_by_status = Issue.group(:status).count
  
      respond_to do |format|
        format.pdf do
          pdf = generate_pdf_report
          send_data pdf.render, 
                    filename: "issues_report.pdf",
                    type: "application/pdf",
                    disposition: "attachment"
        end
      end
    end
  
    private
  
    def generate_pdf_report
      Prawn::Document.new do |pdf|
        pdf.text "Issues Report", size: 24, style: :bold, align: :center
        pdf.move_down 20
  
        # Summary section
        pdf.text "Summary", size: 18, style: :bold
        pdf.move_down 10
        
        summary_data = [
          ["Total Issues", @issues.count],
          ["New", Issue.by_status('New').count],
          ["In Progress", Issue.by_status('In Progress').count],
          ["Closed", Issue.by_status('Closed').count]
        ]
        
        pdf.table(summary_data, header: true, width: pdf.bounds.width) do
          style(row(0), background_color: 'dddddd', font_style: :bold)
        end
  
        pdf.move_down 20
  
        # Issues list
        pdf.text "All Issues", size: 18, style: :bold
        pdf.move_down 10
  
        issue_data = [["Title", "Project", "Status", "Priority", "Created"]]
        @issues.each do |issue|
          issue_data << [
            issue.title,
            issue.project.title,
            issue.status,
            issue.priority_label,
            issue.created_at.strftime("%Y-%m-%d")
          ]
        end
  
        pdf.table(issue_data, header: true, width: pdf.bounds.width, 
                  cell_style: { size: 9 }) do
          style(row(0), background_color: 'dddddd', font_style: :bold)
        end
      end
    end
  end