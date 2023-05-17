
// Create a model class
class CartItem {
final int id;
final String title;
final num price;
final String image;

CartItem(this.id, this.title, this.price,this.image);

}

//create actions

class AddToCartAction {
  CartItem item;
  AddToCartAction(this.item);
}

class RemoveToCartAction {
  int index;
  RemoveToCartAction(this.index);
}

//caret reducer
List<CartItem> cartReducer(List<CartItem> items, dynamic action) {
  if (action is AddToCartAction) {
    return List.from(items)..add(action.item);
  } else if (action is RemoveToCartAction){
    return List.from(items)..removeAt(action.index);
  } else {
    return items;
  }
}


