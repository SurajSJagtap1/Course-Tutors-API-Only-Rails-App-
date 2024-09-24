require 'sidekiq'

class MyJob
    include Sidekiq::Job

    def perform
        10.times do
            sleep(1)
            puts 'Executing First Sidekiq Job'
        end
    end
end