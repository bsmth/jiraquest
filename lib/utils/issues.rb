# frozen_string_literal: true

# Queries, opens and closes issues
class Issues
  # Create a new issue
  # IssueBot.new(r, t).create_issue('title', 'body')
  def create_issue(title, body)
    @c.create_issue(@repo, title, body)
  end

  # IssueBot.new(r, t).close_issue(2)
  def close_issue(number)
    @c.close_issue(@repo, number)
  end

  # List all issues for the repository
  def list_issues
    issues = @c.list_issues(@repo)
    puts "#{@repo} has #{issues.length} issues"
  end

  # List all open issues for the repository
  def open_issues
    issues = @c.list_issues(@repo, state: 'open')
    puts "#{@repo} has #{issues.length} open issues"
  end

  # List all closed issues for the repository
  def closed_issues
    issues = @c.list_issues(@repo, state: 'closed')
    puts "#{@repo} has #{issues.length} closed issues"
  end

  # Add a constructive comment to an issue number, example:
  # IssueBot.new(r, t).comment(1, 'STFU N00B!')
  def comment(number, comment)
    @c.add_comment(@repo, number, comment)
  end
end
