import 'package:payment_integration/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:payment_integration/features/checkout/data/models/amount_model/details.dart';
import 'package:payment_integration/features/checkout/data/models/item_list_model/item.dart';
import 'package:payment_integration/features/checkout/data/models/item_list_model/item_list_model.dart';

({AmountModel amount, ItemListModel itemList}) transactionData() {
    var amount = AmountModel(
      currency: 'USD',
      total: '100',
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: '100'),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(name: 'Apple', quantity: 10, price: "4", currency: 'USD'),
      OrderItemModel(name: 'Apple', quantity: 12, price: "5", currency: 'USD'),
    ];
    var itemList = ItemListModel(items: orders);
    return (amount: amount, itemList: itemList);
  }