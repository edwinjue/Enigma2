class Keygen
	attr_reader :key
	def initialize(input = nil)
    if input.nil?
      @key = create_new_key
    else
    	@key = "%05d" % input
    end
	end

  def create_new_key
     "%05d" % Random.new.rand(99999)
  end

end
