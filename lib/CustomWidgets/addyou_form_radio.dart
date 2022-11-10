import 'package:brinder/Utils/extensions.dart';
import 'package:flutter/material.dart';

import 'package:brinder/Utils/colors.dart';

typedef OnTapCallback = void Function(dynamic);

class AddYouFormRadio extends StatefulWidget {
  final OnTapCallback onTap;
  final String title;
  final Map<String, dynamic> options;

  const AddYouFormRadio({
    Key? key,
    required this.onTap,
    required this.title,
    required this.options,
  }) : super(key: key);

  @override
  State<AddYouFormRadio> createState() => _AddYouFormRadioState();
}

class _AddYouFormRadioState extends State<AddYouFormRadio> {
  late final String _title;
  late final Map<String, dynamic> _options;

  int _value = -1;

  @override
  void initState() {
    _title = widget.title;
    _options = widget.options;

    super.initState();
  }

  void _onTap(int index) {
    setState(() => {_value = index});
    widget.onTap(_options.values.elementAt(index));
  }

  Widget _buildRadioIcon(int index) {
    return GestureDetector(
      onTap: () => {_onTap(index)},
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.circle,
            color: _value == index ? primary : primaryLight,
            size: 30,
          ),
          Icon(
            Icons.circle,
            color: Colors.white,
            size: _value == index ? 20 : 25,
          ),
        ],
      ),
    );
  }

  Widget _buildOption(int index) {
    return ListTile(
      title: Text(
        _options.keys.elementAt(index).toCapitalized(),
        style: Theme.of(context).textTheme.bodyText1,
      ),
      onTap: () => {_onTap(index)},
      leading: _buildRadioIcon(index),
    );
  }

  Widget _buildOptions() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        _options.keys.length,
        (index) => _buildOption(index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: secondary,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _title,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
          ),
          _buildOptions(),
        ],
      ),
    );
  }
}
