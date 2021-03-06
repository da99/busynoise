require 'rubygems'
require 'sinatra'


configure do
  
  error do
    %~
    <html>
        <head>
          <title>Error</title>
        </head>
        <body>
          <h1>:{</h1>
          <p>Something went wrong. Come back later when it gets fixed.</p>
        </body>
    </html>
    ~
  end # error -------------------------------------------------------------------

  not_found do
    %~
        <html>
          <head>
            <title>Error</title>
          </head>
          <body>
            <h1>:P</h1>
            <p>Sorry, the page you are looking for does not exist.</p>
          </body>
        </html>
    ~  
  end # not_found ----------------------------------------------------------------
  
end


get '/' do
  redirect "/egg"
end

get "/egg" do
  File.read( File.expand_path('./public/egg/index.html') )
end

get "/eggtimer/?" do

  redirect "/egg"

end

get '/*beep*.*' do
  exts = ['mp3', 'wav'].detect  { |e| e == params['splat'].last.downcase }
  not_found if !exts
  redirect "http://megauni.s3.amazonaws.com/beeping.#{exts}" 
end
