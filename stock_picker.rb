def stock_picker(stocks)
  solution = []
  max_profit = 0
  buy_day = 0
  sell_day = 0

  for i in 0..stocks.length - 1
    j = i + 1
    for j in j..stocks.length - 1
      potential_profit = stocks[j] - stocks[i]
      if potential_profit > max_profit
        max_profit = potential_profit
        solution = []
        buy_day = i
        sell_day = j
        solution.push(i, j)
      end
    end
  end
  "Buy on day #{buy_day} and sell on day #{sell_day} for a profit of $#{max_profit}"
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
# => [1,4] for a profit of $15 - $3 == $12
