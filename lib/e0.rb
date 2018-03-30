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
    
    def bits_salida=(b)
        @bits_salida=b.to_i
    end
    
    def inicio
        @i_p=@primer.length-1
        @i_s=@segundo.length-1
        @i_t=@tercer.length-1
        @i_c=@cuarto.length-1
    end
    
    def operacion
        for i in 0..(@bits_salida-1)
            suma=@primer[@i_p].to_i(2)+@segundo[@i_s].to_i(2)+@tercer[@i_t].to_i(2)+@cuarto[@i_c].to_i(2)
            @r1[0],@r1[1]=@r1[1],@r1[0]
            @salida+=XOR(XOR(XOR(@primer[@i_p],@segundo[@i_s]),XOR(@tercer[@i_t],@cuarto[@i_c])),@r1[1])
            suma+=@r1.to_i(2)
            suma=suma/2
            suma=suma.to_s(2)
            r2=@r1.dup
            r2[0],r2[1]=r2[1],r2[0]
            t2=r2.dup
            t2[0]=r2[1]
            t2[1]=XOR(r2[0],r2[1])
            suma_1=XOR(suma,t2)
            @r1=XOR(suma_1,@r1)
            @i_p-=1
            @i_s-=1
            @i_t-=1
            @i_c-=1
        end
        puts "Salida: #{@salida}"
    end
    
    def XOR(a,b)
        temp=a.unpack('C*').zip(b.unpack('C*'))
        temp=temp.map {|x,y| x^y}.join
        return temp
    end
    
end
