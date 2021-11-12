part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
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
  final Checkout checkout;
  CheckoutLoaded(
      {this.fullName,
      this.address,
      this.city,
      this.country,
      this.deliveryFee,
      this.email,
      this.products,
      this.subtotal,
      this.total,
      this.zipCode})
      : checkout = Checkout(
            fullName: fullName,
            address: address,
            city: city,
            country: country,
            deliveryFee: deliveryFee,
            email: email,
            products: products,
            subtotal: subtotal,
            total: total,
            zipCode: zipCode);

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
