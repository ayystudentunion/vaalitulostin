require 'spec_helper'

describe ElectoralAlliance do
  before(:each) do
    stub_result_class!
  end

  def stub_result_class!
    allow(Result).to receive(:calculate_votes!)
    allow(Result).to receive(:alliance_proportionals!)
    allow(Result).to receive(:coalition_proportionals!)
  end

  it 'calculates the cached candidate vote sum' do
    votes = 10
    alliance = FactoryGirl.create(:electoral_alliance)
    result   = FactoryGirl.create(:result)
    candidate = FactoryGirl.create(:candidate, :electoral_alliance => alliance)
    another_candidate = FactoryGirl.create(:candidate, :electoral_alliance => alliance)
    FactoryGirl.create(:candidate_result, :vote_sum_cache => votes,
                                          :candidate => candidate, :result => result)
    FactoryGirl.create(:candidate_result, :vote_sum_cache => votes,
                                          :candidate => another_candidate, :result => result)

    alliance.vote_sum_caches.find_by_result_id(result.id).alliance_vote_sum_cache.to_i.should == 2 * votes
  end

  it 'calculates votes only from one result' do
    votes = 10
    alliance = FactoryGirl.create(:electoral_alliance)
    result   = FactoryGirl.create(:result)
    another_result   = FactoryGirl.create(:result)
    candidate = FactoryGirl.create(:candidate, :electoral_alliance => alliance)
    FactoryGirl.create(:candidate_result, :vote_sum_cache => votes,
                                          :candidate => candidate, :result => result)
    FactoryGirl.create(:candidate_result, :vote_sum_cache => votes,
                                          :candidate => candidate, :result => another_result)

    alliance.vote_sum_caches.find_by_result_id(result.id).alliance_vote_sum_cache.to_i.should == 1 * votes
  end
end
