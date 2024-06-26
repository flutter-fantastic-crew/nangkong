import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/view_model/circular_indicator_view_model.dart';
import 'package:flutter_study/widget/home/circular_inner_free_type_info.dart';
import 'package:flutter_study/widget/home/circular_inner_remaining_time.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class FreeTypeCircularIndicator extends StatelessWidget {
  final PlanEntity plan;

  const FreeTypeCircularIndicator({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CircularIndicatorViewModel(plan: plan),
        builder: (context, child) {
          return CircularPercentIndicator(
            radius: 90,
            lineWidth:
                context.watch<CircularIndicatorViewModel>().isPressed ? 4 : 1.5,
            backgroundWidth: 1.5,
            percent: context.read<CircularIndicatorViewModel>().percent,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: const Color(0xFFF2F2F2),
            progressColor: Colors.black,
            widgetIndicator: Center(
              child: Container(
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Listener(
                    onPointerDown: (e) => context
                        .read<CircularIndicatorViewModel>()
                        .setIsPressed(true),
                    onPointerUp: (e) => context
                        .read<CircularIndicatorViewModel>()
                        .setIsPressed(false),
                    child: Transform.rotate(
                      angle: radians(-360 *
                              context
                                  .read<CircularIndicatorViewModel>()
                                  .percent)
                          .toDouble(),
                      child: SvgPicture.asset(
                        'assets/icons/timer.svg',
                        colorFilter: const ColorFilter.mode(
                            Colors.black, BlendMode.srcIn),
                      ),
                    ),
                  )),
            ),
            animation: true,
            // TODO : animation 추가
            center: context.watch<CircularIndicatorViewModel>().isPressed
                ? CircularInnerRemainingTime(
                    startDate: plan.startDate, endDate: plan.endDate)
                : CircularInnerFreeTypeInfo(
                    totalConsumption: plan.totalConsumption,
                    totalIncome: plan.totalIncome),
          );
        });
  }
}
