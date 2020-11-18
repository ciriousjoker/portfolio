import 'package:flutter/material.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';

class ProjectCardWidget extends StatelessWidget {
  final Widget child;

  const ProjectCardWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // TODO: Parameter based on blur radius
      padding: const EdgeInsets.all(8),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          // TODO: Parameter
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.white38,
              // TODO: Parameter
              blurRadius: 6,
            )
          ],
        ),
        child: Material(
          // TODO: Parameter
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(
                  UIHelper.VerticalSpaceMedium,
                ).copyWith(
                  top: UIHelper.VerticalSpaceSmall,
                ),
                constraints: BoxConstraints(maxWidth: 512),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
