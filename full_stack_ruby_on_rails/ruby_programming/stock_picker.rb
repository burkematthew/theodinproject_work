PRICES = [7,13,1,29,5,18,6,12,20]

def stock_picker(prices)
  profits = []
  prices.each_with_index do |buy, buy_index|
    prices.slice(buy_index + 1..prices.length).each_with_index do |sell, sell_index|
      profits.push({
        profit: sell - buy,
        buy_index: buy_index,
        sell_index: buy_index + sell_index + 1
      })
    end
  end
  max_profit = profits.max_by{|k| k[:profit] }
  [max_profit[:buy_index], max_profit[:sell_index]]
end

p stock_picker(PRICES)
