# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
# require "sprockets/railtie"
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CodenamesApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.word_base = [
      'bardzo',
      'przez',
      'zdanie',
      'jest',
      'świetnie',
      'dużo',
      'przed',
      'jego',
      'chłopiec',
      'stary',
      'jeden',
      'albo',
      'trzy',
      'przez',
      'gorący',
      'powietrze',
      'słowo',
      'także',
      'małe',
      'na zewnątrz',
      'inne',
      'dłoń',
      'wszystko',
      'port',
      'olbrzymi',
      'twój',
      'tutaj',
      'duży',
      'każdy',
      'taki',
      'który',
      'dlaczego',
      'czas',
      'jeśli',
      'będzie',
      'rodzaj',
      'znowu',
      'zwierze',
      'długi',
      'mama',
      'rzecz',
      'świat',
      'jego',
      'ziemia',
      'ojciec',
      'więcej',
      'dzień',
      'strona',
      'powinien',
      'szkoła',
      'najwięcej',
      'ludzie',
      'moje',
      'ciągle',
      'słońce',
      'pierwszy',
      'cztery',
      'pomiędzy',
      'w dół',
      'strona',
      'nigdy',
      'teraz',
      'ostatni',
      'nowy',
      'miasto',
      'drzewo',
      'miejsce',
      'gdzie',
      'daleko',
      'morze',
      'tylko',
      'późno',
      'każdy',
      'blisko',
      'prawdziwy',
      'życie',
      'nasze',
      'niewiele',
      'proste',
      'razem',
      'kilka',
      'następny',
      'samogłoska',
      'biały',
      'dzieci',
      'wojna',
      'przeciwko',
      'wzór',
      'przykład',
      'osoba',
      'zawsze',
      'pieniądze',
      'muzyka',
      'droga',
      'mapa',
      'często',
      'dopóki',
      'mila',
      'rzeka',
      'zimny',
      'samochód',
      'stopy',
      'głos',
      'drugi',
      'książka',
      'miasto',
      'pewny',
      'nauki ścisłe',
      'przyjaciel',
      'pomysł',
      'maszyna',
      'gwiazda',
      'pudełko',
      'rzeczownik',
      'pewny',
      'twarz',
      'główny',
      'piękno',
      'wystarczająco',
      'dziewczynka',
      'zwykły',
      'przód',
      'młody',
      'gotowy',
      'tydzień',
      'czerwony',
      'zielony',
      'szybki',
      'ocean',
      'ptak',
      'ciepły',
      'wkrótce',
      'ciało',
      'minuta',
      'pies',
      'silny',
      'bezpośredni',
      'umysł',
      'poza',
      'piosenka',
      'ogon',
      'drzwi',
      'fakt',
      'produkt',
      'ulica',
      'czarny',
      'krótki',
      'liczebnik',
      'kurs',
      'wiatr',
      'pytanie',
      'pełny',
      'statek',
      'niebieski',
      'połowa',
      'skała',
      'powierzchnia',
      'głęboki',
      'południe',
      'wyspa',
      'problem',
      'stopa',
      'kawałek',
      'zajęty',
      'łódź',
      'szczyt',
      'cały',
      'król',
      'możliwy',
      'samolot',
      'najlepszy',
      'zamiast kogoś',
      'najlepszy',
      'suchy',
      'godzina',
      'lepszy',
      'prawdziwy',
      'tysiąc',
      'podczas',
      'temu',
      'wczesny',
      'gorący',
      'zachód',
      'czasownik',
      'stół',
      'wschód',
      'mniej',
      'język',
      'rano',
      'wśród',
      'wiek',
      'prawo',
      'serce',
      'jestem',
      'wybrzeże',
      'ciężki',
      'cichy',
      'silnik',
      'wysoki',
      'piasek',
      'przemysł',
      'para',
      'ucho',
      'całkiem',
      'sylaba',
      'może',
      'środkowy',
      'nagły',
      'jezioro',
      'kwadrat',
      'głośny',
      'wiosna',
      'sztuka',
      'spółgłoska',
      'naród',
      'komórka',
      'chmura',
      'kamień',
      'dziura',
      'trawa',
      'dokładny',
      'zabawa',
      'z wyjątkiem',
      'wioska',
      'korzeń',
      'drut',
      'równy',
      'delikatny',
      'ciężarówka',
      'hałas',
      'poziom',
      'owad',
      'okres',
      'szeroki',
      'atom',
      'kontynent',
      'tlen',
      'cukier',
      'nowoczesny',
      'rozwiązanie',
      'magnes',
      'wyobrażać sobie',
      'przyrostek',
      'zwłaszcza',
      'figa',
      'nie będzie',
      'niebezpieczeństwo',
      'gruby',
      'do przodu',
      'podobny',
      'doświadczenie',
      'konieczny',
      'ostry',
      'skrzydło',
      'płaszcz',
      'karta',
      'raczej',
      'zespół',
      'tłum',
      'lina',
      'wiersz',
      'sznurek',
      'dzwonek',
      'zależeć od',
      'narzędzie',
      'całkowity',
      'podstawowy',
      'sławny',
      'dolina',
      'wzrok',
      'miejsce',
      'planeta',
      'rodzic',
      'kolonia',
      'zegar ścienny',
      'moje',
      'substancja',
      'stanowisko',
      'świeży',
      'akord',
      'zadowolony',
      'broń',
      'martwy',
      'pustynia',
      'nagły',
      'rynek',
      'stopień',
      'firma',
      'pisklę',
      'wydarzenie',
      'wróg',
      'szczególny',
      'umowa',
      'ramię',
      'ruch',
      'ścieżka',
      'obóz',
      'ciecz',
      'współczynnik',
      'kwarta',
      'muszla',
      'kolacja'
    ]
  end
end
