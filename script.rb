
stocks = [17,3,6,9,15,8,6,1,10]
LAST_DAY = stocks.length

def make_days_hash(stocks)
    days = {}
    stocks.each_with_index do |price,index|
        days["day#{index+1}".to_sym] = {day_num: index+1, day_price: price, max_proft: {day_sold: 0, profit: 0}}
    end
    days
end
def set_max_profit(days)
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
def get_max_profit(days)
    profit = []
    days.keys.each do |day|
        profit.push(days[day][:max_proft][:profit])
    end
    profit.max
end
def get_buy_and_sell_days(days,max_proft)
    day_buy_sell = []
    #go through days and see which matches most profit
    #days are not 0 index so must offset
    days.keys.each do |day|
        if days[day][:max_proft][:profit] == max_proft
            day_buy_sell.push((days[day][:day_num])-1)
            day_buy_sell.push((days[day][:max_proft][:day_sold])-1)
        end
    end
    day_buy_sell
end
def stock_picker(stocks)
    days = make_days_hash(stocks)
    days = set_max_profit(days)
    max_proft = get_max_profit(days)
    get_buy_and_sell_days(days,max_proft)
end
#expected output
p stock_picker(stocks)
#[1,4]  # for a profit of $15 - $3 == $12
