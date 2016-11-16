module CodeGenerator

  COLORS = ["r","g","b","y"]

  def self.generate_secret_code
    secret_code = []
  	4.times do |color|
  		secret_code << COLORS.sample
  	end
    secret_code
  end

end
