import 'dart:math';

import 'package:flutter/material.dart';
import 'package:notsan_tb/pages/content/pageframe_content.dart';
import 'package:notsan_tb/pages/content/pageframe_content_scrollcontroller.dart';

class CardExpander extends StatefulWidget {

  final String title;
  final Widget child;

  final bool initiallyExpanded;
  final Widget? icon;

  final ScrollController? scrollController;

  const CardExpander({ super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = true,
    this.icon,
    this.scrollController,
  });

  @override
  CardExpanderState createState() => CardExpanderState();

}

class CardExpanderState extends State<CardExpander> {

  final GlobalKey _tileKey = GlobalKey();
  final GlobalKey _contentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    final scrollController = ScrollControllerProvider.of(context)?.scrollController;

    return Card(
      child: ExpansionTile(

        key: _tileKey,

        title: Text(widget.title, style: Theme.of(context).textTheme.titleMedium),
        leading: widget.icon,

        shape: const Border(),
        collapsedShape: const Border(),
        initiallyExpanded: widget.initiallyExpanded,

        onExpansionChanged: (bool expanded) {
          if (expanded) {

            WidgetsBinding.instance.addPostFrameCallback((_) async {

              // wait default expansionAnimation duration
              await Future.delayed(const Duration(milliseconds: 200));

              _scrollToExpanded(scrollController);

            });

          }
        },

        children: [
          Container(
            key: _contentKey,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: widget.child,
          )
        ],
      ),
    );
  }

  void _scrollToExpanded(ScrollController? scrollController) {

    // skip, if not ready
    if (!_tileKey.currentContext!.mounted) { return; }
    if (!_contentKey.currentContext!.mounted) { return; }
    if (scrollController == null) { return; }

    // Get the RenderBox of the ExpansionTile
    RenderBox renderBox = _tileKey.currentContext!.findRenderObject() as RenderBox;

    // Get the position of the ExpansionTile relative to the screen
    Offset position = renderBox.localToGlobal(Offset.zero);
    double tileHeight = renderBox.size.height;
    double tileBottom = position.dy + tileHeight;

    // Get the size of the screen
    double screenHeight = MediaQuery.of(context).size.height;
    double systemPadding = MediaQuery.of(context).padding.top;

    // Calculate overlap
    double bottomOverlap = -(screenHeight - tileBottom - kContentPageFramePadding);
    double topOverlap = systemPadding + kContentPageFrameAppbarHeight - kContentPageFramePadding - position.dy;

    if (bottomOverlap > 0 || topOverlap > 0) {

      // calculate scroll alignments
      double toTop = scrollController.offset + (position.dy - kContentPageFrameAppbarHeight + kContentPageFramePadding + systemPadding);
      double toBottom = scrollController.offset + bottomOverlap;

      double offset = (topOverlap > 0 && bottomOverlap < 0)
        ? toTop
        : min(toTop, toBottom);

      // ensure offset is in valid range
      if (offset < 0) {
        offset = 0;
      }
      if (offset > scrollController.position.maxScrollExtent) {
        offset = scrollController.position.maxScrollExtent;
      }

      // scroll to tile
      scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

    }


  }

}
