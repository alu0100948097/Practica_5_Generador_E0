require 'colorize'

class E0
    
    attr_writer :primer, :segundo, :tercer, :cuarto, :r1
	
    def initialize
		@primer=""
        @segundo=""
        @tercer=""
        @cuarto=""
        @r1=""
        @bits_salida=""
        @salida=""
        @i_p=0
        @i_s=0
        @i_t=0
        @i_c=0
	end
    
    def XOR(a,b)
        temp=a.unpack('C*').zip(b.unpack('C*'))
        temp=temp.map {|x,y| x^y}.join
        return temp
    end
    
end
