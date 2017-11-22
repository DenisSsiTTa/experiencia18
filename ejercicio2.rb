require 'date'

class Course
  def initialize(name, fecha1, fecha2)
    @name = name
    @fecha1 = Date.parse(fecha1)
    @fecha2 = Date.parse(fecha2)
  end

  def recau_total
    @dia1 + @dia2 + @dia3 + @dia4
  end

  def recau_total_prom
    recau_total / 4.0
  end

  def comienzo_previo(fecha)
    puts "El curso #{@name} comienza el #{@fecha1}" if @fecha1 < fecha
  end

  def final_posterior(fecha)
    puts "El curso #{@name} finaliza el #{@fecha2}" if @fecha2 > fecha
  end
end

begin
cursos = []
file = File.open('cursos.txt', 'r')
data = file.readlines
file.close

data.each do |line|
  name, fecha1, fecha2 = line.split(', ')
  cursos << Course.new(name, fecha1, fecha2)
end

fecha_hoy = Date.today
fecha_corte = Date.parse('2018-01-01')

raise ArgumentError 'Argumento ERRONEO' if fecha_hoy >= fecha_corte

# Cursos comienzan previo a una fecha entregada
cursos.each do |curso|
  curso.comienzo_previo(fecha_hoy)
end

# Cursos finalizan posterior a una fecha entregada
cursos.each do |curso|
  curso.final_posterior(fecha_hoy)
end

rescue ArgumentError => e
  puts e
end
