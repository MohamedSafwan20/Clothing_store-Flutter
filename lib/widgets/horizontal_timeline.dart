import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HorizontalTimeline extends StatelessWidget {
  const HorizontalTimeline({Key? key, required this.status}) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: TimelineTile(
            axis: TimelineAxis.horizontal,
            alignment: TimelineAlign.center,
            afterLineStyle: const LineStyle(thickness: 2),
            indicatorStyle: status.toUpperCase() == "PICKED UP"
                ? IndicatorStyle(
                    height: 25,
                    color: Theme.of(context).colorScheme.secondary,
                    iconStyle: IconStyle(
                        iconData: Icons.done,
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 20))
                : const IndicatorStyle(height: 15),
            isFirst: true,
            endChild: Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Text("Picked up"),
            ),
          )),
          Expanded(
            child: TimelineTile(
                axis: TimelineAxis.horizontal,
                alignment: TimelineAlign.center,
                afterLineStyle: const LineStyle(thickness: 2),
                beforeLineStyle: const LineStyle(thickness: 2),
                indicatorStyle: status.toUpperCase() == "ON TRANSIT"
                    ? IndicatorStyle(
                        height: 25,
                        color: Theme.of(context).colorScheme.secondary,
                        iconStyle: IconStyle(
                            iconData: Icons.done,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 20))
                    : const IndicatorStyle(height: 15),
                endChild: Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text("On Transit"),
                )),
          ),
          Expanded(
            child: TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              afterLineStyle: const LineStyle(thickness: 2),
              beforeLineStyle: const LineStyle(thickness: 2),
              indicatorStyle: status.toUpperCase() == "OUT FOR DELIVERY"
                  ? IndicatorStyle(
                      height: 25,
                      color: Theme.of(context).colorScheme.secondary,
                      iconStyle: IconStyle(
                          iconData: Icons.done,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20))
                  : const IndicatorStyle(height: 15),
              endChild: Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Text("Out for\ndelivery"),
              ),
            ),
          ),
          Expanded(
            child: TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              beforeLineStyle: const LineStyle(thickness: 2),
              indicatorStyle: status.toUpperCase() == "DELIVERED"
                  ? IndicatorStyle(
                      height: 25,
                      color: Theme.of(context).colorScheme.secondary,
                      iconStyle: IconStyle(
                          iconData: Icons.done,
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20))
                  : const IndicatorStyle(height: 15),
              isLast: true,
              endChild: Container(
                padding: const EdgeInsets.only(top: 10),
                child: const Text("Delivered"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
