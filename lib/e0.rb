class E0

    attr_writer :primer, :segundo, :tercer, :cuarto, :quinto, :r1

    def initialize
	@primer=""
        @segundo=""
        @tercer=""
        @cuarto=""
	@quinto=""
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
	@i_q=@quinto.length-1
    end

    def realimentacion
        @primer=XOR(XOR(@primer[0],XOR(@primer[7],@primer[11])),XOR(@primer[19],@primer[24]))+@primer.chop
        @segundo=XOR(XOR(@primer[0],XOR(@segundo[11],@segundo[15])),XOR(@segundo[23],@segundo[30]))+@segundo.chop
        @tercer=XOR(XOR(@primer[0],XOR(@tercer[3],@tercer[23])),XOR(@tercer[27],@tercer[32]))+@tercer.chop
        @cuarto=XOR(XOR(@primer[0],XOR(@cuarto[3],@cuarto[27])),XOR(@cuarto[35],@cuarto[38]))+@cuarto.chop
	@quinto=XOR(XOR(@primer[0],XOR(@cuarto[8],@cuarto[10])),XOR(@cuarto[17],@cuarto[30]))+@quinto.chop
    end

    def operacion
        for i in 0..(@bits_salida-1)
            suma=@primer[@i_p].to_i(2)+@segundo[@i_s].to_i(2)+@tercer[@i_t].to_i(2)+@cuarto[@i_c].to_i(2)+@quinto[@i_q].to_i(2)
            @r1[0],@r1[1]=@r1[1],@r1[0]
            @salida+=XOR(XOR(XOR(XOR(@primer[@i_p],@segundo[@i_s]),XOR(@tercer[@i_t],@cuarto[@i_c])),@r1[1]),@quinto[@i_q])
            suma+=@r1.to_i(2)
            suma=suma/2
            suma=suma.to_s(2)
            r2=@r1.dup
            r2[0],r2[1]=r2[1],r2[0]
            t2=r2.dup
            t2[0]=r2[1]
            t2[1]=XOR(r2[0],r2[1])
            suma_1=XOR(suma,t2)
            @r1=XOR(suma_1,@r1).rjust(2,'0')
            realimentacion
        end
        puts "Salida: #{@salida}"
    end

    def XOR(a,b)
        temp=a.unpack('C*').zip(b.unpack('C*'))
        temp=temp.map {|x,y| x^y}.join
        return temp
    end

end

@test=E0.new

    puts
    puts "PRÁCTICA: GENERADOR E0 DE BLUETOOTH"
    puts
    print "Introduzca la semilla del primer registro (25 bits): "
    primer=gets.chomp
    while primer.empty? || primer.length!=25
        system "clear"
        if primer.empty?
            puts "No se ha introducido semilla"
        else
            puts "El tamaño de la semilla introducida es incorrecta"
        end
        puts
        print "Introduzca la semilla del primer registro (25 bits): "
        primer=gets.chomp
    end
    @test.primer=primer
    print "Introduzca la semilla del segundo registro (31 bits): "
    segundo=gets.chomp
    while segundo.empty? || segundo.length!=31
        system "clear"
        if segundo.empty?
            puts "No se ha introducido semilla"
            else
            puts "El tamaño de la semilla introducida es incorrecta"
        end
        puts
        print "Introduzca la semilla del segundo registro (31 bits): "
        segundo=gets.chomp
    end
    @test.segundo=segundo
    print "Introduzca la semilla del tercer registro (33 bits): "
    tercer=gets.chomp
    while tercer.empty? || tercer.length!=33
        system "clear"
        if tercer.empty?
            puts "No se ha introducido semilla"
            else
            puts "El tamaño de la semilla introducida es incorrecta"
        end
        puts
        print "Introduzca la semilla del tercer registro (33 bits): "
        tercer=gets.chomp
    end
    @test.tercer=tercer
    print "Introduzca la semilla del cuarto registro (39 bits): "
    cuarto=gets.chomp
    while cuarto.empty? || cuarto.length!=39
        system "clear"
        if cuarto.empty?
            puts "No se ha introducido semilla"
            else
            puts "El tamaño de la semilla introducida es incorrecta"
        end
        puts
        print "Introduzca la semilla del cuarto registro (39 bits): "
        cuarto=gets.chomp
    end
    @test.cuarto=cuarto
    print "Introduzca la semilla del quinto registro (39 bits): "
    quinto=gets.chomp
    while quinto.empty? || quinto.length!=39
        system "clear"
        if quinto.empty?
            puts "No se ha introducido semilla"
            else
            puts "El tamaño de la semilla introducida es incorrecta"
        end
        puts
        print "Introduzca la semilla del quinto registro (39 bits): "
        quinto=gets.chomp
    end
    @test.quinto=quinto
    print "Introduzca la semilla de r1 (2 bits): "
    r1=gets.chomp
    while r1.empty? || r1.length!=2
        system "clear"
        if r1.empty?
            puts "No se ha introducido semilla"
            else
            puts "El tamaño de la semilla introducida es incorrecta"
        end
        puts
        print "Introduzca la semilla de r1 (2 bits): "
        r1=gets.chomp
    end
    @test.r1=r1
    print "Introduzca el número de bits de salida: "
    bits_salida=gets.chomp
    while bits_salida.empty? || bits_salida.length<=0
        system "clear"
        if bits_salida.empty?
            puts "No se ha introducido número de bits de salida"
            else
            puts "El número de bits de salida introducido es 0 o negativo"
        end
        puts
        print "Introduzca el número de bits de salida: "
        bits_salida=gets.chomp
    end
    puts
    @test.bits_salida=bits_salida
    @test.inicio
    @test.operacion
    puts
