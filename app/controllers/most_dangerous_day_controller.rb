class MostDangerousDayController < ApplicationController

  def index
    @most_dangerous_day = DangerousDay.new(search_params)
  end

private

  def search_params
    params.permit(:start_date, :end_date)
  end

end
