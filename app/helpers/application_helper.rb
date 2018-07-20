module ApplicationHelper
    def render_stars(value)
        half = 0
      output = ''
      if (1..5).include?(value.floor)
        value.floor.times { output += '<span class="glyphicon glyphicon-star" aria-hidden="true"></span>'}
      end
      if value.to_f % 1 != 0
        @half = 1
        output += '<span class="glyphicon glyphicon-star half" aria-hidden="true"></span>'
      end
      if value.round + half <= 4
        n = 5 - value.round + half
        n.times {output += '<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>'}
      end
      output.html_safe
    end

  end