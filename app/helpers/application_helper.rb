module ApplicationHelper
  def brands
    Brand.get_all
  end

  def post_categories
    Category.post_categories
  end

  def product_categories
    Category.product_categories
  end

  def category_objects
    CONFIG["category_objects"]
  end

  def product_types
    CONFIG["product_types"]
  end

  def get_page_url(page_title)
    page_path(Page.find_by_title(page_title)) if Page.find_by_title(page_title)
  end
  def in_cart?(product_id)
    current_user.cart_items.get_by_product(product_id).present?
  end

  def dissable?(product)
    unless out_of_stock?(product)
      unless in_cart?(product.id)
        return false
      end
    end
    true
  end

  def out_of_stock?(product)
    product.current_stock == 0 ? true : false
  end

  def cart_price(cart_items)
    price = 0
    cart_items.map {|cart_item| price += cart_item.product.sell_price.to_f}
    price
  end

  def stock_status(product)
    case product.current_stock

    when 0
      "<strong class='text-danger'>Out of stock</strong>".html_safe
    when 1..3
      "<strong class='text-warning'>Hurry, only #{product.current_stock} left</strong>".html_safe
    else
      "<strong class='text-success'>In stock</strong>".html_safe
    end
  end
end
