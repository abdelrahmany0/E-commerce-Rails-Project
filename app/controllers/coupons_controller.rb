class CouponsController < InheritedResources::Base
  before_action :authenticate_user!, only: %i[ new edit update destroy ]
  load_and_authorize_resource


  private

    def coupon_params
      params.require(:coupon).permit(:name)
    end

end
