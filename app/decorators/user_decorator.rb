class UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def authentication_link
    if signed_in?
      h.render 'shared/sign_out_link'
    else
      h.render 'shared/sign_in_link'
    end
  end

  def signed_in?
    id.present?
  end

end
