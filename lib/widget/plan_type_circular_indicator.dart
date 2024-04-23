import 'package:flutter/material.dart';
import 'package:flutter_study/entity/plan_entity.dart';
import 'package:flutter_study/utils/number_util.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PlanTypeCircularIndicator extends StatelessWidget {
  final PlanEntity plan;

  const PlanTypeCircularIndicator({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    final double percent =
        DateTime.now().difference(plan.endDate).inDays.toDouble() /
            plan.startDate.difference(plan.endDate).inDays.toDouble();

    return CircularPercentIndicator(
        radius: 100,
        lineWidth: 1.5,
        percent: percent,
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: const Color(0xFFB8C7CB),
        backgroundColor: Colors.transparent,
        widgetIndicator: Center(
          child: Container(
            width: 14,
            height: 14,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Transform.rotate(
              angle: radians(-360 * percent).toDouble(),
              child: SvgPicture.asset(
                'assets/icons/timer.svg',
                colorFilter:
                    const ColorFilter.mode(Color(0xFFB8C7CB), BlendMode.srcIn),
              ),
            ),
          ),
        ),
        animation: true,
        center: CircularPercentIndicator(
          radius: 90,
          lineWidth: 12,
          percent: plan.remainAmount.toDouble() / plan.totalAmount.toDouble(),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.blueAccent,
          animation: true,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '남은 예산',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${currencyFormat(plan.remainAmount)}원',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '/ ${currencyFormat(plan.totalAmount)}원',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ));
  }
}