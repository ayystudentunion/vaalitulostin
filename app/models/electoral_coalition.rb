class ElectoralCoalition < ActiveRecord::Base

  has_many :coalition_results
  has_many :results, :through => :coalition_results

  has_many :electoral_alliances
  has_many :candidates, :through => :electoral_alliances

  has_many :coalition_drawings
  has_many :coalition_draws, :through => :coalition_drawings

  default_scope order(:number_order)

  validates_presence_of :name, :shorten

  def order_alliances alliance_data
    original_array = alliance_data.to_a
    sorted_array = original_array.sort {|x,y| x.last <=> y.last}
    ordered_hashes = sorted_array.map {|array| {:id => array.first, :position => array.last}}
    ordered_hashes.each do |hash|
      self.electoral_alliances.find_by_id(hash[:id]).update_attribute :signing_order_position, hash[:position]
    end
  end

  def preliminary_vote_sum
    electoral_alliances.map(&:votes).map(&:preliminary_sum).sum # did not work with sql the same way as in alliances
  end

  def countable_vote_sum
    electoral_alliances.map(&:votes).map(&:countable_sum).sum # sql trololooo
  end

  def has_fix_needing_candidates?
    self.electoral_alliances.select{|a| a.has_fix_needing_candidates?}.count > 0
  end

  def self.are_all_ordered?
    self.where(:number_order => nil).count == 0
  end

  def self.give_orders coalition_data
    coalition_data.to_a.each do |array|
      self.find_by_id(array.first).update_attribute :number_order, array.last
    end
  end

end
