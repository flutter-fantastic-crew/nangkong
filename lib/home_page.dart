import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nangkong/widget/appbar_widget.dart';
import 'package:nangkong/view_model/home_page_view_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: SafeArea(
        child: ChangeNotifierProvider<HomePageViewModel>(
          create: (_) => HomePageViewModel(),
          builder: (context, child) {
            return Column(
              children: [
                Consumer<HomePageViewModel>(
                    builder: (context, homePageViewModel, child) {
                  return Expanded(
                    child: PageView.builder(
                        onPageChanged: homePageViewModel.changePage,
                        controller: homePageViewModel.planSliderController,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.all(50),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child:
                                Text(homePageViewModel.plans[index].planName),
                          );
                        },
                        itemCount: homePageViewModel.plans.length),
                  );
                }),
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                        context.watch<HomePageViewModel>().plans.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: context
                                            .watch<HomePageViewModel>()
                                            .currentPage ==
                                        index
                                    ? const Color(0xFF181818)
                                    : Colors.grey,
                              ),
                            )),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
