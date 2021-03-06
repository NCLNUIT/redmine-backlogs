class UpdateIssue < ActiveRecord::Migration
    def self.up
        if CustomField.find_by_name('Backlog').nil?
            cf = IssueCustomField.create(name: 'Backlog', field_format: 'int', is_for_all: 1, is_filter: 1)
            cf.trackers = Tracker.all.to_a.each
            cf.save
        end
    end

    def self.down
        IssueCustomField.find_by_name('Backlog').delete unless IssueCustomField.find_by_name('Backlog').nil?
    end
end
