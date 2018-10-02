def consolidate_cart(cart)
  consolidated = {}
  cart.each do |item|
    item.each do |name, details|
      consolidated[name] ||= details
      consolidated[name][:count] ? consolidated[name][:count] += 1 : consolidated[name][:count] = 1
    end
  end
  consolidated
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    coupon_name = coupon[:item]
    if cart[coupon_name] && cart[coupon_name][:count] >= coupon[:num]
      if cart["#{coupon_name} W/COUPON"]
        cart["#{coupon_name} W/COUPON"][:count] += 1
      else
        cart["#{coupon_name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
        cart["#{coupon_name} W/COUPON"][:clearance] = cart[coupon_name][:clearance]
      end
      cart[coupon_name][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item, details|
    if details[:clearance] == true
      new_price = details[:price] *= 0.80
      details[:price] = new_price.round(1)
    end
  end
  cart
end

def checkout(cart, coupons)
  consolidated = consolidate_cart(cart)
  
  
end
