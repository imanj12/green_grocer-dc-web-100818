def consolidate_cart(cart)
  consolidated = {}
  cart.each do |item|
    item.each do |name, stats|
      consolidated[name] ||= stats
      consolidated[name][:count] ? consolidated[name][:count] += 1 : consolidated[name][:count] = 1
    end
  end
  consolidated
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    coupon_name = coupon[:item]
    if defined? cart[coupon_name] && cart[coupon_name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += 1
      else
        cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
        cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
      end
      cart[name][:count] -= coupon[:num]
    end
  end
  cart
  end
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
