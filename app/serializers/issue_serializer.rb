class IssueSerializer < ActiveModel::Serializer
    attributes :title,
        :year,
        :front_cover,
        :back_cover,
        :featured_image,
        :subtitle,
        :issue_number,
        :magazine_id,
        :language_id,
        :size_id,
        :stitching_id,
        :format_id,
        :medium_id,
        :crew_id,
        :country_id
end
