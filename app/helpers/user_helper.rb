# frozen_string_literal: true

module UserHelper
  def active?(tab_name)
    "active" if tab_name == params[:tab]
  end
end
