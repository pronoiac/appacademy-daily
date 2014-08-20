def stock_picker(prices)
  max_profit = 0
  best_dates = []
  prices.each_with_index do |buy_price, buy_date|
    for sell_date in buy_date+1...prices.count
      profit = prices[sell_date] - buy_price
      if profit > max_profit
        max_profit = profit
        best_dates = [buy_date, sell_date]
      end
    end
  end
  
  best_dates
end


def test
  p stock_picker [10, 20, 30, 50, 20]
  p stock_picker [10, 9, 8, 5, 3]
end


test
  