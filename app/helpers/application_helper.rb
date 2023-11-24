# frozen_string_literal: true

module ApplicationHelper
  def title(yield_title)
    title = if yield_title
            yield_title
          else
            "Terapia Online Onde Você Estiver"
          end

    title
  end
end
