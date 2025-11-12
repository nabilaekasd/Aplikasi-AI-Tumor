import 'package:axon_vision/utils/size_config.dart';
import 'package:flutter/material.dart';

class FluidSpaceSizer extends StatelessWidget {
  final double minSpace;
  final double maxSpace;
  final bool horizontal;

  const FluidSpaceSizer({
    super.key,
    required this.minSpace,
    required this.maxSpace,
    this.horizontal = true,
  });

  @override
  Widget build(BuildContext context) {
    double space = SizeConfig.fluidSpacing(minSpace, maxSpace);

    return horizontal
        ? SizedBox(width: SizeConfig.horizontal(space))
        : SizedBox(height: SizeConfig.vertical(space));
  }
}
