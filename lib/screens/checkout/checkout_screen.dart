import 'package:eshop/blocs/checkout/checkout_bloc.dart';
import 'package:eshop/widgets/custom_appbar.dart';
import 'package:eshop/widgets/custom_navbar.dart';
import 'package:eshop/widgets/order_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final TextEditingController emailController = TextEditingController();
    // final TextEditingController nameController = TextEditingController();
    // final TextEditingController addressController = TextEditingController();
    // final TextEditingController cityController = TextEditingController();
    // final TextEditingController countryController = TextEditingController();
    // final TextEditingController zipCodeController = TextEditingController();

    return Scaffold(
        appBar: CustomAppBar(
          title: 'Checkout',
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    if (state is CheckoutLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is CheckoutLoaded) {
                      return ElevatedButton(
                          onPressed: () {
                            context
                                .read<CheckoutBloc>()
                                .add(ConfirmCheckout(checkout: state.checkout));
                          },
                          child: Text(
                            'Order now',
                          ));
                    } else
                      return Text("something went wrong");
                  },
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CheckoutLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Customer information",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(email: value));
                    }, context, 'Email'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(fullName: value));
                    }, context, 'Full name'),
                    Text("Delivery information",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(address: value));
                    }, context, 'Address'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(city: value));
                    }, context, 'City'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(country: value));
                    }, context, 'Country'),
                    _buildTextFormField((value) {
                      context
                          .read<CheckoutBloc>()
                          .add(UpdateCheckout(zipCode: value));
                    }, context, 'Zip code'),
                    Text("Order summary",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    OrderSummary(),
                  ],
                );
              } else
                return Text('something went wrong');
            },
          ),
        )
        // bottomNavigationBar: CustomNavBar(),
        );
  }

  Padding _buildTextFormField(
    Function(String)? onChanged,
//TextEditingController controller,
    BuildContext context,
    String labelText,
  ) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(width: 75, child: Text(labelText)),
            Expanded(
              child: TextFormField(
                onChanged: onChanged,
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(left: 10),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
              ),
            )
          ],
        ));
  }
}
