# coding: UTF-8
require 'csv'

namespace :seed do
  namespace :development do

    desc 'Default project settings'
    task :configuration => :environment do
      REDIS.set 'total_vote_count', '10417'
      REDIS.set 'right_to_vote', '29563'
      REDIS.set 'candidates_to_select', '60'
      REDIS.set 'spare_candidates_to_select', '2'
      REDIS.set 'checking_minutes_username', 'tlkpj'
      REDIS.set 'checking_minutes_password', 'pass123'
      REDIS.set 'mailaddress', 'hostmaster-hyy@enemy.fi'

      AdminUser.create!(:email => 'admin@example.com', :password => 'pass123', :password_confirmation => 'pass123', :role => 'admin')
      AdminUser.create!(:email => 'sihteeri@example.com', :password => 'pass123', :password_confirmation => 'pass123', :role => 'secretary')
    end

    desc 'Create faculties'
    task :faculties => :environment do
      # Create faculties
      Faculty.create! :code => 'B',   :name => 'Biotieteellinen'
      Faculty.create! :code => 'E',   :name => 'Eläinlääketieteellinen'
      Faculty.create! :code => 'F',   :name => 'Farmasia'
      Faculty.create! :code => 'H',   :name => 'Humanistinen'
      Faculty.create! :code => 'K',   :name => 'Käyttäytymistieteellinen'
      Faculty.create! :code => 'L',   :name => 'Lääketieteellinen'
      Faculty.create! :code => 'ML',  :name => 'Matemaattis-luonnontieteellinen'
      Faculty.create! :code => 'MM',  :name => 'Maa- ja metsätieteellinen'
      Faculty.create! :code => 'O',   :name => 'Oikeustieteellinen'
      Faculty.create! :code => 'T',   :name => 'Teologinen'
      Faculty.create! :code => 'V',   :name => 'Valtiotieteellinen'
    end

    desc 'Create electoral coalitions and alliances'
    task :electoral => :environment do
      # Voting areas
      VotingArea.create! :code => '1',   :name => 'Unicafe Ylioppilasaukio',    :password => 'pass123'
      VotingArea.create! :code => '2',   :name => 'Yliopiston päärakennus',     :password => 'pass123'
      VotingArea.create! :code => '3',   :name => 'Yliopiston päärakennus',     :password => 'pass123'
      VotingArea.create! :code => '4',   :name => 'Porthania',                  :password => 'pass123'
      VotingArea.create! :code => '5',   :name => 'Porthania',                  :password => 'pass123'
      VotingArea.create! :code => '6',   :name => 'Oppimiskeskus Aleksandria',  :password => 'pass123'
      VotingArea.create! :code => '7',   :name => 'Topelia',                    :password => 'pass123'
      VotingArea.create! :code => '8',   :name => 'Metsätalo',                  :password => 'pass123'
      VotingArea.create! :code => '9',   :name => 'Valtiotieteellisen tdk:n',   :password => 'pass123'
      VotingArea.create! :code => '10',  :name => 'Oppimiskeskus Minerva',      :password => 'pass123'
      VotingArea.create! :code => '11',  :name => 'Terveystieteiden keskus',    :password => 'pass123'
      VotingArea.create! :code => '12',  :name => 'Hammaslääketieteen',         :password => 'pass123'
      VotingArea.create! :code => '13',  :name => 'Physicum',                   :password => 'pass123'
      VotingArea.create! :code => '14',  :name => 'Chemicum',                   :password => 'pass123'
      VotingArea.create! :code => '15',  :name => 'Exactum',                    :password => 'pass123'
      VotingArea.create! :code => '16',  :name => 'Viikin Infokeskus',          :password => 'pass123'
      VotingArea.create! :code => '17',  :name => 'Viikin Biokeskus 3',         :password => 'pass123'
      VotingArea.create! :code => '18',  :name => 'Viikin EE-talo',             :password => 'pass123'
      VotingArea.create! :code => '19',  :name => 'Ympäristöekologian',         :password => 'pass123'
      VotingArea.create! :code => '20',  :name => 'Vaasan yliopisto',           :password => 'pass123'
      VotingArea.create! :code => 'E1',  :name => 'Porthania',                  :password => 'pass123'
      VotingArea.create! :code => 'E2',  :name => 'Viikin Infokeskus',          :password => 'pass123'
      VotingArea.create! :code => 'E3',  :name => 'Physicum',                   :password => 'pass123'
      VotingArea.create! :code => 'E4',  :name => 'Terveystieteiden keskus',    :password => 'pass123'
      VotingArea.create! :code => 'E5',  :name => 'Unicafe',                    :password => 'pass123'


      # Electoral Coalition
      hyal = ElectoralCoalition.create! :name => 'Ainejärjestöjen vaalirengas',                  :shorten => 'HYAL', :number_order => "10"
      osak = ElectoralCoalition.create! :name => 'Osakuntien suuri vaalirengas',                 :shorten => 'Osak', :number_order => "9"
      mp = ElectoralCoalition.create! :name => 'Maailmanpyörä',                                  :shorten => 'MP', :number_order => "8"
      help = ElectoralCoalition.create! :name => 'HELP',                                         :shorten => 'HELP', :number_order => "6"
      pelast = ElectoralCoalition.create! :name => 'Pelastusrengas',                             :shorten => 'Pelast', :number_order => "4"
      snaf = ElectoralCoalition.create! :name => 'Svenska Nationer och Ämnesföreningar (SNÄf)',  :shorten => 'SNÄf', :number_order => "5"

      # Single alliance coalitions
      demarit = ElectoralCoalition.create! :name => 'Opiskelijademarit',            :shorten => 'OSY', :number_order => "3"
      tsemppi = ElectoralCoalition.create! :name => 'Tsemppi Group',                :shorten => 'Tsempp', :number_order => "2"
      piraatit = ElectoralCoalition.create! :name => 'Akateemiset piraatit',        :shorten => 'Pirate', :number_order => "1"
      persut = ElectoralCoalition.create! :name => 'Perussuomalainen vaaliliitto',  :shorten => 'Peruss', :number_order => "7"
      libera = ElectoralCoalition.create! :name => 'Liberaalinen vaaliliitto - Yksilönvapauden puolesta',  :shorten => 'Libera', :number_order => "5"
      ite1 = ElectoralCoalition.create! :name => 'Itsenäinen ehdokas 1',  :shorten => 'ITE1', :number_order => "11"

      # Electoral Alliances
      mp.electoral_alliances.create! :name => 'HYYn Vihreät - De Gröna vid HUS',                               :shorten => 'HyVi',    :delivered_candidate_form_amount => '60', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      mp.electoral_alliances.create! :name => 'Sitoutumaton vasemmisto - Obunden vänster - Independent left',  :shorten => 'SitVas',  :delivered_candidate_form_amount => '60', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      hyal.electoral_alliances.create! :name => 'Humanistit',                                                  :shorten => 'Humani',  :delivered_candidate_form_amount => '40', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      hyal.electoral_alliances.create! :name => 'Viikki',                                                      :shorten => 'Viikki',  :delivered_candidate_form_amount => '16', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      help.electoral_alliances.create! :name => 'Pykälä',                                                      :shorten => 'Pykälä',  :delivered_candidate_form_amount => '44', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      hyal.electoral_alliances.create! :name => 'Kumpula',                                                     :shorten => 'Kumpul',  :delivered_candidate_form_amount => '17', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      help.electoral_alliances.create! :name => 'LKS/HLKS',                                                    :shorten => 'LKSHLK',  :delivered_candidate_form_amount => '15', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      hyal.electoral_alliances.create! :name => 'Käyttis',                                                     :shorten => 'Käytti',  :delivered_candidate_form_amount => '12', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      osak.electoral_alliances.create! :name => 'ESO',                                                         :shorten => 'ESO',     :delivered_candidate_form_amount => '60', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      pelast.electoral_alliances.create! :name => 'Kokoomusopiskelijat 1',                                     :shorten => 'Kok1',    :delivered_candidate_form_amount => '49', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      help.electoral_alliances.create! :name => 'EKY',                                                         :shorten => 'EKY',     :delivered_candidate_form_amount => '16', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      hyal.electoral_alliances.create! :name => 'Valtiotieteilijät',                                           :shorten => 'Valtio',  :delivered_candidate_form_amount => '16', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      hyal.electoral_alliances.create! :name => 'Teologit',                                                    :shorten => 'Teolog',  :delivered_candidate_form_amount => '26', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      osak.electoral_alliances.create! :name => 'HO-Natura',                                                   :shorten => 'HO-Nat',  :delivered_candidate_form_amount => '39', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      osak.electoral_alliances.create! :name => 'EPO',                                                         :shorten => 'EPO',     :delivered_candidate_form_amount => '57', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      pelast.electoral_alliances.create! :name => 'Kokoomusopiskelijat 2',                                     :shorten => 'Kok2',    :delivered_candidate_form_amount => '49', :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
      osak.electoral_alliances.create! :name => 'Domus Gaudiumin Osakunnat',                                   :shorten => 'DG',      :delivered_candidate_form_amount => '44', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      osak.electoral_alliances.create! :name => 'PPO',                                                         :shorten => 'PPO',     :delivered_candidate_form_amount => '42', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      pelast.electoral_alliances.create! :name => 'Keskeiset',                                                 :shorten => 'Kesk',    :delivered_candidate_form_amount => '18', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      osak.electoral_alliances.create! :name => 'SavO',                                                        :shorten => 'SavO',    :delivered_candidate_form_amount => '42', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      osak.electoral_alliances.create! :name => 'KSO-VSO',                                                     :shorten => 'KSOVSO',  :delivered_candidate_form_amount => '29', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      demarit.electoral_alliances.create! :name => 'Opiskelijademarit',                                        :shorten => 'OSY',     :delivered_candidate_form_amount => '32', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      snaf.electoral_alliances.create! :name => 'StudOrg',                                                     :shorten => 'StudO',   :delivered_candidate_form_amount => '12', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      osak.electoral_alliances.create! :name => 'SatO-ESO2',                                                   :shorten => 'SatESO',  :delivered_candidate_form_amount => '43', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      snaf.electoral_alliances.create! :name => 'Nationerna',                                                  :shorten => 'Nation',  :delivered_candidate_form_amount => '18', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      tsemppi.electoral_alliances.create! :name => 'Tsemppi Group',                                            :shorten => 'Tsempp',  :delivered_candidate_form_amount => '15', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      snaf.electoral_alliances.create! :name => 'Codex-Thorax',                                                :shorten => 'CodTho',  :delivered_candidate_form_amount => '8', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      pelast.electoral_alliances.create! :name => 'KD Helsingin Opiskelijat',                                  :shorten => 'KD',      :delivered_candidate_form_amount => '14', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      piraatit.electoral_alliances.create! :name => 'Akateemiset piraatit',                                    :shorten => 'Pirate',  :delivered_candidate_form_amount => '4', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      persut.electoral_alliances.create! :name => 'Perussuomalainen vaaliliitto',                              :shorten => 'Peruss',  :delivered_candidate_form_amount => '3', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      snaf.electoral_alliances.create! :name => 'Ämnesföreningarna',                                          :shorten => 'Ämnesf',  :delivered_candidate_form_amount => '4', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      libera.electoral_alliances.create! :name => 'Liberaalinen vaaliliitto - Yksilönvapauden puolesta',         :shorten => 'Libera',  :delivered_candidate_form_amount => '3', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
      ite1.electoral_alliances.create! :name => 'Itsenäinen ehdokas 1',         :shorten => 'ITE1',  :delivered_candidate_form_amount => '1', :primary_advocate_social_security_number => '123456-9876', :primary_advocate_email => 'asiamies2@example.com'
    end

    desc 'Create fixer advocates'
    task :fixer_advocates => :environment do
      AdvocateUser.create! :ssn => '123456-123K', :email => 'asiamies1@example.com', :password => 'pass123'
      AdvocateUser.create! :ssn => '123456-9876', :email => 'asiamies2@example.com', :password => 'pass123'
    end

    desc 'Create candidate data from seed.csv'
    task :candidates => :environment do
      Candidate.transaction do
        puts '... Creating candidates ...'
        csv_contents = CSV.read('doc/vaalit_2009_ehdokkaat.csv')
        csv_contents.shift
        csv_contents.each do |row|

          faculty = Faculty.find_or_create_by_code row[4]

          alliance_name = (row[11] || row[8])
          electoral_alliance = ElectoralAlliance.find_by_name alliance_name
          unless electoral_alliance
            electoral_coalition = ElectoralCoalition.find_or_create_by_name row[9] if row[9]
            electoral_coalition = ElectoralCoalition.create! :name => alliance_name unless electoral_coalition
            electoral_alliance = electoral_coalition.electoral_alliances.create! :name => alliance_name, :delivered_candidate_form_amount => 0, :primary_advocate_social_security_number => '123456-123K', :primary_advocate_email => 'asiamies1@example.com'
          end
          electoral_alliance.update_attribute :signing_order_position, row[10]

          def generate_ssn
            @@order = (@@order ||= 0) + 1
            @@days   ||= (1..31).to_a
            @@months ||= (1..12).to_a
            @@years  ||= (50..90).to_a
            @@check  ||= '0123456789ABCDEFHJKLMNPRSTUVWXY'

            day   = sprintf "%02d", @@days[rand(@@days.length)]
            month = sprintf "%02d", @@months[rand(@@months.length)]
            year  = sprintf "%02d", @@years[rand(@@years.length)]
            order = sprintf "%03d", @@order
            check = @@check[("#{day}#{month}#{year}#{order}".to_i) % 31]

            "#{day}#{month}#{year}-#{order}#{check}"

          end

          candidate = Candidate.create! :candidate_number       => row[0],
                                        :lastname               => row[1],
                                        :firstname              => row[2],
                                        :social_security_number => (row[3] || generate_ssn),
                                        :faculty                => faculty,
                                        :address                => row[5],
                                        :postal_information     => row[6],
                                        :email                  => "#{row[7].split('@')[0]}@example.com",
                                        :candidate_name         => row[8],
                                        :electoral_alliance     => electoral_alliance,
                                        :sign_up_order_position => row[12],
                                        :notes                  => row[13]
        end
      end
    end

    desc 'Create early voting data'
    task :early_voting => :environment do
      puts '... Creating early voting areas ...'
      (1..5).to_a.each do |i|
        voting_area = VotingArea.find_by_code "E#{i}"
        puts "... #{voting_area.name}"
        csv_contents = CSV.read("doc/votes/E#{i}")
        csv_contents.shift
        csv_contents.each do |row|
          Candidate.find_by_candidate_number(row[0]).votes.create! :voting_area => voting_area, :vote_count => row[3]
        end
      end
    end

    desc 'Create main voting data'
    task :main_voting => :environment do
      puts '... Creating voting areas ...'
      (1..20).to_a.each do |i|
        voting_area = VotingArea.find_by_code "#{i}"
        puts "... #{voting_area.name}"
        csv_contents = CSV.read("doc/votes/#{i}")
        csv_contents.shift
        csv_contents.each do |row|
          Candidate.find_by_candidate_number(row[0]).votes.create! :voting_area => voting_area, :vote_count => row[3]
        end
      end
    end

  end

  task :development do
    Rake::Task['seed:redis:reset_keys'].invoke
    Rake::Task['seed:development:configuration'].invoke
    Rake::Task['seed:development:faculties'].invoke
    Rake::Task['seed:development:electoral'].invoke
    Rake::Task['seed:development:candidates'].invoke
    Rake::Task['seed:development:early_voting'].invoke
    Rake::Task['seed:development:main_voting'].invoke
    Rake::Task['seed:development:fixer_advocates'].invoke
  end

end