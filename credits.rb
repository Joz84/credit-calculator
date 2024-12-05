def calculator(day_nbr, batch_nbr)
  day_nbr_0 = day_nbr 
  refs = [
    [40,4,4800],
    [10,2,1000],
    [10,1,800],
    [5,1,400]
  ]
  permuations = refs.permutation.to_a
  results_credits = []
  results_coeffs = []
  results_rests = []
  permuations.each do |refs|
    coeffs = []
    credits = 0
    day_nbr = day_nbr_0
    refs.each do |ref|
      if day_nbr/ref[0] >= 1 && batch_nbr/ref[1] >= 1
        min = [day_nbr/ref[0], batch_nbr/ref[1]].min
        credits += min * ref[2]
        day_nbr -= min * ref[0]
        coeffs << min
      else
        coeffs << 0
      end
    end
    results_rests << day_nbr
    results_credits << credits
    results_coeffs << coeffs
  end
  max = results_credits.max
  i = results_credits.index(max)
  coeffs = results_coeffs[i]
  arr = []
  coeffs.each_with_index { |coeff, index| arr << "#{coeff} X #{refs[index][2]}" if coeff > 0 }
  str = arr.join(" + ")
  rest = results_rests[i]
  {credits: max, coeffs: str, rest: rest}
end
