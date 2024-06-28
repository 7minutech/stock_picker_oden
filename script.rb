
stocks = [17,3,6,9,15,8,6,1,10]
LAST_DAY = stocks.length
def stock_picker(stocks)
end
def make_days_hash(stocks)
    days = {}
    stocks.each_with_index do |price,index|
        days["day#{index+1}".to_sym] = {day_num: index+1, day_price: price, max_proft: {day_sold: 0, profit: 0}}
    end
    days
end
def get_max_profit(days)
    #loop through each day
    days.keys.each do |day_i|
        max_proft = -100
        #can't sell after last day
        if days[day_i][:day_num] == LAST_DAY
            break
        end
        #loop through days after current day
        days.keys.each do |day_j|
            if days[day_i][:day_num] < days[day_j][:day_num]
                profit = days[day_j][:day_price] - days[day_i][:day_price]
                #store price and day of most profit
                if profit > max_proft
                    max_proft = profit
                    days[day_i][:max_proft][:profit] = max_proft
                    days[day_i][:max_proft][:day_sold] = days[day_j][:day_num]
                end
            end
        end
    end
    days
end


make_days_hash(stocks)
stock_picker(stocks)
p get_max_profit(make_days_hash(stocks))
#expected output
#1,4]  # for a profit of $15 - $3 == $12
