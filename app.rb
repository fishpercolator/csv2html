require './csv2html'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/process' do
    template = params['template']
    csv = CSV.open(params['csv']['tempfile'], headers: true)
    Csv2Html.new(csv, template).render
  end

end
