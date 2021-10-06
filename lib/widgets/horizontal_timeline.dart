import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class HorizontalTimeline extends StatelessWidget {
  const HorizontalTimeline({Key? key}) : super(key: key);

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
            indicatorStyle: IndicatorStyle(
                height: 25,
                color: Theme.of(context).colorScheme.primary,
                iconStyle: IconStyle(
                    iconData: Icons.done,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 20)),
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
                indicatorStyle: const IndicatorStyle(height: 15),
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
              indicatorStyle: const IndicatorStyle(height: 15),
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
              indicatorStyle: const IndicatorStyle(height: 15),
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
