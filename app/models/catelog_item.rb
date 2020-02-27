class CatelogItem < ActiveRecord::Base

  belongs_to :product, foreign_key: :collection_id
  belongs_to :post, foreign_key: :collection_id

  def self.desc
    order(created_at: :desc)
  end
  
  def self.save_catelog_item(object_type, catelog_id, have_to_delete_object_ids, have_to_add_object_ids)
    have_to_delete_object_ids.each do |object_id|
      CatelogItem.where(collection_id: object_id, collection_type: object_type, catelog_id: catelog_id).first.destroy
    end

    have_to_add_object_ids.each do |object_id|
      object = object_type.classify.safe_constantize.find(object_id)
      name = object.name if object_type == "products"
      name = object.title if object_type == "posts"
      CatelogItem.create(name: name, collection_id: object.id, collection_type: object_type, 
                          status: 1, catelog_id: catelog_id, collection_url: "/#{object_type}/#{object_id}")
    end
  end
end