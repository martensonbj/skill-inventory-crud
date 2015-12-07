class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/skills' do
    @skills = SkillInventory.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    SkillInventory.create(params[:skill])
    redirect '/skills'
  end

  post '/save_image' do
    @filename = params[:file][:filename]
    file = params[:file][:filename]

    File.open("./uploads/#{@filename}", 'wb') do |f|
      f.write(file.read)
    end

    erb :show_image
  end

  get '/send_email' do
    erb :send_email
  end

  post '/send_email' do
    @skills = SkillInventory.all
    @name = params[:name]
    Pony.mail({ :to => params[:given_email],
                :from => 'brenna.school.projects@gmail.com',
                :subject => 'You Sent an Email from Sinatra #{@name}!!',
                :headers => { 'Content-Type' => 'text/html' },
                :body    => erb(:'/emails/email', layout: :'/emails/email_wrapper') })


    Pony.options = ({ :via_options          => {
            :address              => "smtp.gmail.com",
            :port                 => 587,
            :user_name            => 'brenna.school.projects@gmail.com',
            :password             => 'code4lyfe',
            :authentication       => 'plain',
            :enable_starttls_auto => true
            },
            :via                  => :smtp })

    redirect '/skills'

  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :show
  end

  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, params[:skill])
    redirect "/skills/#{id}"
  end

  delete '/skills/:id' do |id|
    SkillInventory.delete(id.to_i)
    redirect "/skills"
  end

  # get '/contact' do
  #   erb :contact
  # end

  not_found do
    erb :error
  end

end
