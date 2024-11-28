import 'package:flutter/material.dart';

class ContentPageFrame extends StatelessWidget {

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
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 64.0,
            flexibleSpace: SafeArea(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {

                  // Calculate scroll progress: 1.0 when expanded, 0.0 when collapsed
                  final double scrollProgress = (constraints.maxHeight - kToolbarHeight) /
                      (64.0 - kToolbarHeight);

                  // Clamp progress between 0 and 1 for safe opacity calculation
                  final double clampedProgress = scrollProgress.clamp(0.0, 1.0);

                  return Stack(
                    children: [

                      // If subtitle is present, show title and subtitle (fades out on scroll)
                      if (subtitle.isNotEmpty)
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
                                    title,
                                    style: Theme.of(context).textTheme.titleLarge,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    subtitle,
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
                        opacity: subtitle.isNotEmpty
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
                              title,
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
              children: children,
            )
          )
        ],
      )
    );

  }
}
