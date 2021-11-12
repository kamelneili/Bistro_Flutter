import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/models/category_model.dart';
import 'package:eshop/models/checkout_model.dart';
import 'package:eshop/models/product_model.dart';
import 'package:eshop/repositories/category/base_category_repository.dart';
import 'package:eshop/repositories/checkout/base_checkout_repository.dart';
import 'package:eshop/repositories/product/base_product_repository.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  final FirebaseFirestore _firebaseFirestore;
  CheckoutRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Future<void> addCheckout(Checkout checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}
