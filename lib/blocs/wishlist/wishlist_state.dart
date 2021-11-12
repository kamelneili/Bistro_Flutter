import 'package:equatable/equatable.dart';
import 'package:eshop/models/wishlist_model.dart';

abstract class WishlistState extends Equatable {
  const WishlistState();
  @override
  List<Object?> get props => [];
}

class WishlistLoading extends WishlistState {}

class WishlistLoaded extends WishlistState {
  final Wishlist wishlist;
  const WishlistLoaded({this.wishlist = const Wishlist()});
  @override
  List<Object?> get props => [wishlist];
}

class WishlistError extends WishlistState {}
