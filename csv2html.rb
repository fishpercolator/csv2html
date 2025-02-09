require 'liquid'
require 'erb'

class Csv2Html

  attr_reader :csv, :template

  def initialize(csv, template)
    @csv = csv
    @template = Liquid::Template.parse(template)
  end

  # Returns a string rendering the CSV using these templates
  def render
    layout.result(binding)
  end

  private

  def layout
    ERB.new <<~HTML
    <!doctype html>
    <html>
      <head>
        <title>Generated output</title>
      </head>
      <body>
        <main>
<% csv.each do |row| %>
  <%= template.render(row.to_h) %>
<% end %>
        </main>
      </body>
    </html>
    HTML
  end

end
