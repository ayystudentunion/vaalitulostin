class Vote < ActiveRecord::Base

  belongs_to :voting_area
  belongs_to :candidate

  validates_presence_of :voting_area, :candidate

  scope :ready, joins(:voting_area).where('voting_areas.taken = ?', true)

  scope :fixed, from("(SELECT COALESCE(v.fix_count, v.vote_count) as vote_count, v.id, v.candidate_id, v.voting_area_id, v.created_at, v.updated_at, v.fix_count FROM votes v) votes")

  scope :with_fixes, where('fix_count is not null')

  default_scope :include => :candidate, :order => 'candidates.candidate_number'

  def self.calculated
    votes_ready = self.ready.sum(:vote_count)
    if votes_ready == self.sum(:vote_count)
      100
    else
      total_votes = REDIS.get('total_vote_count')
      if total_votes
        (100 * votes_ready / total_votes.to_i).to_i
      else
        0
      end
    end
  end

end
