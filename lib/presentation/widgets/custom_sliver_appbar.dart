

import 'package:flutter/material.dart';

class CustomSliverAppbar extends StatelessWidget {
  final String title;
  final Image background;
  final Widget? customWidget;
  final List<Widget>? actions;

  const CustomSliverAppbar({super.key, required this.title, required this.background, this.customWidget, this.actions});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      iconTheme: const IconThemeData(
        color: Colors.white70, //change your color here
      ),
      actions: actions,
      // floating: true,
      expandedHeight: 400,
      backgroundColor: Colors.black87,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                title, 
                overflow: customWidget != null ? TextOverflow.ellipsis : null,
                )
              ),
            customWidget ?? const SizedBox(),
          ],
        ),
        expandedTitleScale: 1.5,
        titlePadding: const EdgeInsets.all(15),
        centerTitle: false,
        background: Stack(
          children: [

            SizedBox.expand(
              child: background,
            ),

            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    stops: [0.0, 0.3],
                    colors: [
                      Colors.black87,
                    Colors.transparent,
                  ])
                ),
              ),
            ),

            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1.0],
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                    
                  ])
                ),
              ),
            ),
            
          ],
        ),
              
      ),
    );
  }
}