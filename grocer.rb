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
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
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
