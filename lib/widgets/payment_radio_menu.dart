import 'package:ca_todbadminton/config/config.dart';
import 'package:flutter/material.dart';

class PaymentMethodSelection extends StatefulWidget {
  @override
  _PaymentMethodSelectionState createState() => _PaymentMethodSelectionState();
}

class _PaymentMethodSelectionState extends State<PaymentMethodSelection> {
  int selectedMethod = 0; // 0: Chuyển khoản, 1: Thanh toán khi nhận sân

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<int>(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.zero,
          title: Text('Internet Banking'),
          value: 0,
          groupValue: selectedMethod,
          onChanged: (value) {
            setState(() {
              selectedMethod = value!;
            });
          },
        ),
        if (selectedMethod == 0)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: largePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text('ACB'),
                      subtitle: Text('5738597'),
                    ),

                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text('Nam A Bank'),
                      subtitle: Text('0823216213'),
                    ),

                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      title: Text('Momo'),
                      subtitle: Text('0823216213'),
                    ),
                    // Add more account options as needed
                  ],
                ),
              ],
            ),
          ),
        RadioListTile<int>(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.zero,
          title: Text('Payment upon receipt'),
          value: 1,
          groupValue: selectedMethod,
          onChanged: (value) {
            setState(() {
              selectedMethod = value!;
            });
          },
        ),
      ],
    );
  }
}
