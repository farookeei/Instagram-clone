import 'package:flutter/material.dart';
import 'package:test/widgets/appbar.dart';

// ignore: must_be_immutable
class DescriptionArea extends StatefulWidget {
  DescriptionArea(
      {required this.channelname,
      required this.isMore,
      required this.dscription,
      required this.subtitile});

  final String channelname;
  final String subtitile;
  final String dscription;
  bool isMore;

  @override
  _DescriptionAreaState createState() => _DescriptionAreaState();
}

class _DescriptionAreaState extends State<DescriptionArea> {
  void ontap() {
    setState(() => widget.isMore = !widget.isMore);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: ontap,
        child: RichText(
            text: TextSpan(
                text: widget.channelname,
                style: Theme.of(context).primaryTextTheme.bodyText1!.merge(
                    TextStyle(color: black, fontWeight: FontWeight.w700)),
                children: [
              TextSpan(
                  text: widget.isMore
                      ? ' ${widget.subtitile}'
                      : ' ${widget.dscription}',
                  style: Theme.of(context).primaryTextTheme.bodyText1!.merge(
                      TextStyle(fontWeight: FontWeight.w400, color: black))),
              !widget.isMore
                  ? TextSpan()
                  : TextSpan(
                      text: ' .... more',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .merge(TextStyle(fontWeight: FontWeight.w300)))
            ])),
      ),
    );
  }
}
