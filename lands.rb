class Larget_small
    def l_s_num(array)
        num_lar = array.max()
        num_min = array.min()
        puts "Larget : #{num_lar} , Samllest : #{num_min}"
    end
end

d1 = Larget_small.new
puts d1.l_s_num([3, 7, 2, 8, -5, 12])