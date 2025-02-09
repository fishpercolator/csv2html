require 'erb'

class Csv2Html

  attr_reader :csv, :template

  def initialize(csv, template=nil)
    @csv = csv
    @template = ERB.new(template || default_template)
  end

  # Returns a string rendering the CSV using these templates
  def render
    template.result(binding)
  end

  private

  def default_template
    <<~HTML
    <!doctype html>
    <html>
      <head>
        <title>A title</title>
      </head>
      <body>
        <main>
          <% csv.each do |row| %>
            <section>
              <h1><%= row[:title] %></h1>
              <p><%= row[:description] %></p>
            </section>
          <% end %>
        </main>
      </body>
    </html>
    HTML
  end

end
