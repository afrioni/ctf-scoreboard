class ScoreAdjustment < FeedItem
  include ActionView::Helpers::TextHelper

  validates :point_value, :text, presence: true
  validate :point_value_is_not_zero

  # rubocop:disable MethodLength
  # TODO: Rewrite this.
  def description
    color = ''
    verb = ''
    points = point_value
    if points < 0
      color = 'red'
      verb = 'decreased'
    else
      color = 'green'
      verb = 'increased'
    end
    %(Score was #{verb} by <span style="color:#{color};">#{pluralize(points.abs, 'point')}</span>)
  end
  # rubocop:enable MethodLength

  def icon
    (point_value < 0) ? 'chevron-down' : 'chevron-up'
  end

  def point_value_is_not_zero
    errors.add(:point_value, 'must not be zero.') if point_value == 0
  end
end
