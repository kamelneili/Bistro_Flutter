import 'package:eshop/models/checkout_model.dart';
import 'package:eshop/models/product_model.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(Checkout checkout);
}
