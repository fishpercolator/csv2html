#!/usr/bin/env ruby

require 'csv'
require './csv2html'

template = <<~HTML
<section>
  <h1><%= title %></h1>
  <p><%= description %></p>
</section>
HTML

csv_s = <<~CSV
title,description
Twin Peaks,Awesome
Dirty Dancing,Acceptable
Step Up 2,Terrible
CSV
csv = CSV.parse(csv_s, headers: true, header_converters: :symbol)

puts Csv2Html.new(csv).render
