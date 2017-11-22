class Table
  attr_reader :name

  def initialize(name, dia1, dia2, dia3, dia4)
    @name = name
    @dia1 = dia1.to_i
    @dia2 = dia2.to_i
    @dia3 = dia3.to_i
    @dia4 = dia4.to_i
  end

  def recau_total
    @dia1 + @dia2 + @dia3 + @dia4
  end

  def recau_total_prom
    recau_total / 4.0
  end
end

casino = []
file = File.open('casino.txt', 'r')
data = file.readlines
file.close

data.each do |line|
  name, dia1, dia2, dia3, dia4 = line.split(', ')
  casino << Table.new(name, dia1, dia2, dia3, dia4)
end

# Mostrar la mesa q mas recaudo
max_mesa = 0
max_recau = 0
casino.each do |mesa|
  if mesa.recau_total > max_recau
    max_mesa = mesa.name
    max_recau = mesa.recau_total
  end
end

puts "La mesa #{max_mesa} es la que más recauda con #{max_recau}"

# promedio recaudado total
prom_total = casino.inject(0) { |sum, mesa| sum + mesa.recau_total_prom }
prom_total /= casino.length

puts "El promedio total de lo recaudado es #{prom_total} "
