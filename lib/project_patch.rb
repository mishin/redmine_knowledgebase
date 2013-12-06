module KnowledgeBase
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        unloadable
        has_many :categories, :class_name => "KbCategory", :foreign_key => "project_id"
        has_many :articles, :class_name => "KbArticle", :foreign_key => "project_id"
      end
    end
  end
end

unless Project.included_modules.include?(KnowledgeBase::ProjectPatch)
  Project.send(:include, KnowledgeBase::ProjectPatch)
end