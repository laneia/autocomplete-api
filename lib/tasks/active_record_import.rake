namespace :import do
  require "csv"
  desc "imports data from csv to postgresql"
  words = []
  task :batch_record => :environment do
    puts 'Deleting'
    Dictionary.delete_all
    puts 'Done Deleting'

    columns = [:word]
    # values = CSV.read(Rails.root.join('lib/wordlist.csv'))

    ary = []
    index = 0
    CSV.foreach(Rails.root.join('lib/wordlist.csv')) do |row|
      ary << row
      if ary.length == 5000
        puts "At #{index}"
        Dictionary.import columns, ary, validate: true#, ignore: true
        ary.clear
      end  
      index = index + 1   
    end     
  end
end
