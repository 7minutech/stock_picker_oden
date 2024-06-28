
stocks = [17,3,6,9,15,8,6,1,10]

def stock_picker(stocks)
end
def make_days_hash(stocks)
    days = {}
    stocks.each_with_index do |price,index|
        days["day#{index+1}".to_sym] = {day_num: index+1, day_price: price, max_proft: 0}
    end
    days
end
p make_days_hash(stocks)
stock_picker(stocks)
#expected output
#1,4]  # for a profit of $15 - $3 == $12
