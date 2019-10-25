CLEARANCE_ITEM_DISCOUNT_RATE = 0.20
BIG_PURCHASE_DISCOUNT_RATE = 0.10


def find_item_by_name_in_collection(name, collection)
  i = 0 
  while i < collection.length do 
    return collection[i] if name === collection[i][:item]
    i += 1 
  end   
end

def consolidate_cart(cart)

  i = 0 
  end_cart = []
  while i < cart.count do 
    item_name = cart[i][:item]
    sought_item = find_item_by_name_in_collection(item_name, end_cart)
    
    if sought_item
      sought_item[:count] += 1 
    else   
      cart[i][:count] = 1 
      end_cart.push(cart[i])
    end
    
    i += 1 
  end
  end_cart
end

def apply_coupons(cart, coupons)
     i = 0
  while i < coupons.count do
    coupon = coupons[i]
    item_w_coupon = find_item_by_name_in_collection(coupon[:item], cart)
    item_is_in_basket = !!item_w_coupon
    count_applies = item_is_in_basket && item_w_coupon[:count] >= coupon[:num]

    if item_is_in_basket and count_applies
      apply_coupon_to_cart(item_w_coupon, coupon, cart)
    end
    i += 1
  end

  cart
end

def apply_clearance(cart)
  i = 0
  while i < cart.length do
    item = cart[i]
    if item[:clearance]
      discounted_price = ((1 - CLEARANCE_ITEM_DISCOUNT_RATE) * item[:price]).round(2)
        item[:price] = discounted_price
    end
    i += 1
  end

  cart
end

def checkout(cart, coupons)
  j = 0 
  total = 0 
  
  con_cart = consolidate_cart(cart)
  apply_coupons(ccart, coupons)
  apply_clearance(ccart)
  
  while j < con_cart.length 
   total += item_t_cost(ccart[j])
   j += 1
  end
  
  total >= 100 ? total * (1.0 - BIG_PURCHASE_DISCOUNT_RATE) : total
  
end

def item_t_cost(j)
 j[:count] * j[:price]
end  