import 'package:equatable/equatable.dart';
import 'package:eshop/models/product_model.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? address;
  final String? city;
  final String? country;
  final String? zipCode;
  final String? total;
  final String? subtotal;
  final String? deliveryFee;
  final List<Product>? products;
  const Checkout(
      {required this.fullName,
      required this.address,
      required this.city,
      required this.country,
      required this.deliveryFee,
      required this.email,
      required this.products,
      required this.subtotal,
      required this.total,
      required this.zipCode});
  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['citey'] = city;
    customerAddress['country'] = country;
    customerAddress['zipCode'] = zipCode;
    return {
      'customerAddres': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!
    };
  }

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipCode,
        total,
        subtotal,
        deliveryFee,
        products
      ];
}
