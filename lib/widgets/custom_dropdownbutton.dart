import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropdownCountryBox extends StatefulWidget {
  final String country;
  ValueSetter<String> callBack;

  DropdownCountryBox(this.country, {Key? key, required this.callBack})
      : super(key: key);

  @override
  _DropdownCountryBoxState createState() => _DropdownCountryBoxState();
}

class _DropdownCountryBoxState extends State<DropdownCountryBox> {
  @override
  Widget build(BuildContext context) {
    return _createHeader();
  }

  Widget _createHeader() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 0.1,
                offset: const Offset(0, 0.1)),
          ],
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Text(
            widget.country,
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          const Spacer(),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
