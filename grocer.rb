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
  matching_item
end

def apply_clearance(cart)
   i = 0
  while i < coupons.count do
    coupon = coupons[i]
    item_with_coupon = find_item_by_name_in_collection(coupon[:item], cart)
    item_is_in_basket = !!item_with_coupon
    count_is_big_enough_to_apply = item_is_in_basket && item_with_coupon[:count] >= coupon[:num]

    if item_is_in_basket and count_is_big_enough_to_apply
      apply_coupon_to_cart(item_with_coupon, coupon, cart)
    end
    i += 1
  end

  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
