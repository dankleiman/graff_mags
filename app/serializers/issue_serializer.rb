class IssueSerializer < ActiveModel::Serializer
  attributes :id,
      :title,
      :year,
      :location,
      # :front_cover,
      # :back_cover,
      # :featured_image,
      :subtitle,
      :issue_number,
      :magazine_id,
      :featured_image_thumb
      # :front_cover_large,
      # :front_cover_medium

  def front_cover_large
    object.front_cover.url
  end

  def featured_image_thumb
    object.featured_image.url(:thumb)
  end

  def front_cover_medium
    object.front_cover.url(:medium)
  end
end
