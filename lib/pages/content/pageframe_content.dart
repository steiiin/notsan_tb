import 'package:flutter/material.dart';
import 'package:notsan_tb/pages/content/pageframe_content_scrollcontroller.dart';

const kContentPageFrameAppbarHeight = 64.0;
const kContentPageFramePadding = 4.0;

class ContentPageFrame extends StatefulWidget {

  final String title;
  final String subtitle;
  final List<Widget> children;

  const ContentPageFrame({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.children,
  });

  @override
  ContentPageFrameState createState() => ContentPageFrameState();

}

class ContentPageFrameState extends State<ContentPageFrame> {

  final ScrollController _scrollController = ScrollController();
  final bool testHook = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollControllerProvider(
        scrollController: _scrollController,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: kContentPageFrameAppbarHeight,
              flexibleSpace: SafeArea(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {

                    // Calculate scroll progress: 1.0 when expanded, 0.0 when collapsed
                    final double scrollProgress = (constraints.maxHeight - kToolbarHeight) /
                        (kContentPageFrameAppbarHeight - kToolbarHeight);

                    // Clamp progress between 0 and 1 for safe opacity calculation
                    final double clampedProgress = scrollProgress.clamp(0.0, 1.0);

                    return Stack(
                      children: [

                        // If subtitle is present, show title and subtitle (fades out on scroll)
                        if (widget.subtitle.isNotEmpty)
                          Opacity(
                            opacity: clampedProgress,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 72.0, // Accounts for back arrow and padding
                                right: 16.0,
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.title,
                                      style: Theme.of(context).textTheme.titleLarge,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      widget.subtitle,
                                      style: Theme.of(context).textTheme.labelSmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        // Always show app bar title (fades in on scroll)
                        Opacity(
                          opacity: widget.subtitle.isNotEmpty
                              ? 1.0 - clampedProgress
                              : 1.0, // Always visible if no subtitle
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 72.0, // Accounts for back arrow and padding
                              right: 16.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                widget.title,
                                style: Theme.of(context).textTheme.titleLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );

                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: widget.children
              )
            )
          ],
        )
      )
    );

  }
}
