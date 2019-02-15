require 'pry'

Dir.glob(File.join("./lib/*.rb")).each do |file|
  require file
end
