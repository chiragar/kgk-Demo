part of 'cart_bloc.dart';

class CartState extends Equatable {
  final List<Data> cartItems;

  const CartState({this.cartItems = const []});

  CartState copyWith({List<Data>? cartItems}) {
    return CartState(cartItems: cartItems ?? this.cartItems);
  }

  @override
  List<Object> get props => [cartItems];
}
