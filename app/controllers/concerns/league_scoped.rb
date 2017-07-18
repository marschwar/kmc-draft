module LeagueScoped
  extend ActiveSupport::Concern

  included do
    before_filter :set_league
  end

  def set_league
    league_id = params.delete :league_id
    raise unless league_id
    
    @league = League.find league_id
  end
end