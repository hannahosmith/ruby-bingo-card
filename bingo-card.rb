require "prawn"

def align(num)
  if num <= 9
    " #{num}"
  else
    "#{num}"
  end
end

b_col = (1..15).to_a.sample(5)
i_col = (16..30).to_a.sample(5)
n_col = (31..45).to_a.sample(4)
g_col = (46..60).to_a.sample(5)
o_col = (61..75).to_a.sample(5)

bingo_card = <<-BINGO
+-----+-----+-----+-----+-----+
|  B  |  I  |  N  |  G  |  O  |
+-----+-----+-----+-----+-----+
| #{align(b_col[0])}  |  #{i_col[0]} |  #{n_col[0]} |  #{g_col[0]} |  #{o_col[0]} |
+-----+-----+-----+-----+-----+
| #{align(b_col[1])}  |  #{i_col[1]} |  #{n_col[1]} |  #{g_col[1]} |  #{o_col[1]} |
+-----+-----+-----+-----+-----+
| #{align(b_col[2])}  |  #{i_col[2]} |  F  |  #{g_col[2]} |  #{o_col[2]} |
+-----+-----+-----+-----+-----+
| #{align(b_col[3])}  |  #{i_col[3]} |  #{n_col[2]} |  #{g_col[3]} |  #{o_col[3]} |
+-----+-----+-----+-----+-----+
| #{align(b_col[4])}  |  #{i_col[4]} |  #{n_col[3]} |  #{g_col[4]} |  #{o_col[4]} |
+-----+-----+-----+-----+-----+
BINGO

puts bingo_card

# Prawn::Document.generate("bingo.pdf") do
#   text bingo_card
# end
header = ["B","I","N","G","O"]

n_col.insert(2,"F")

Prawn::Document.generate("bingo.pdf") do
  define_grid(columns: 5, rows: 6)

  header.each_with_index do |char, i|
    grid(0,i).bounding_box do
      stroke_bounds
      text char, align: :center, valign: :center, size: 50, style: :bold
    end
  end

  b_col.each_with_index do |num, i|
    grid((i+1), 0).bounding_box do
      stroke_bounds
      text num.to_s, align: :center, valign: :center, size: 50
    end
  end

  i_col.each_with_index do |num, i|
    grid((i+1), 1).bounding_box do
      stroke_bounds
      text num.to_s, align: :center, valign: :center, size: 50
    end
  end

  n_col.each_with_index do |num, i|
    grid((i+1), 2).bounding_box do
      stroke_bounds
      text num.to_s, align: :center, valign: :center, size: 50
    end
  end

  g_col.each_with_index do |num, i|
    grid((i+1), 3).bounding_box do
      stroke_bounds
      text num.to_s, align: :center, valign: :center, size: 50
    end
  end

  o_col.each_with_index do |num, i|
    grid((i+1), 4).bounding_box do
      stroke_bounds
      text num.to_s, align: :center, valign: :center, size: 50
    end
  end
end
