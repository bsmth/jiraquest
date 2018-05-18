require 'yaml/store'
require 'figlet'

DATA = YAML::Store.new(File.expand_path('../../assets/data.yml', __dir__))
FIGLET = Figlet::Font.new(File.expand_path('../../assets/fonts/big.flf', __dir__))
